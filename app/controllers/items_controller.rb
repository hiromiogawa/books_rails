class ItemsController < ApplicationController
  before_action :require_user_logged_in

  def show
    @item = Item.find(params[:id])
    @user  = current_user
    @addto_users = @item.addto_users

    if current_user.addto?(@item)
      @ownership = @item.ownerships.where(user_id: @user.id).first
    end
  end

  def edit
    @item = Item.find(params[:id])
    @user  = current_user
    @addto_users = @item.addto_users
    @ownership = @item.ownerships.where(user_id: @user.id).first
  end

  def update
    @item = Item.find(params[:id])
    @user  = current_user
    @ownership = @item.ownerships.where(user_id: @user.id).first

    if @ownership.update(ownership_params)
      flash[:success] = 'ステータスは正常に更新されました'
      redirect_to @item
    else
      flash.now[:danger] = 'ステータスは更新されませんでした'
      render :edit
    end
  end

  def new
    @items = []

    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        imageFlag: 1,
        hits: 30,
      })

      results.each do |result|
        item = Item.find_or_initialize_by(read(result))
        @items << item
      end
    end
  end

  def mybook
    @statsu = params[:statsu]
    @user = current_user

    if @statsu == '全て' or @statsu.nil?
      @mybooks = @user.ownerships.page(params[:page]).per(9).order("ownerships.updated_at desc")
    else
      @mybooks = @user.ownerships.where("ownerships.statsu": @statsu).page(params[:page]).per(9).order("ownerships.updated_at desc")
    end
  end


  private
  # Strong Parameter
  def ownership_params
    params.require(:addto).permit(:statsu, :media, :memo, :imp)
  end

end
