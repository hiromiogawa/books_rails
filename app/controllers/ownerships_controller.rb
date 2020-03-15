class OwnershipsController < ApplicationController
  def create
   @item = Item.find_or_initialize_by(isbn: params[:item_isbn])

    unless @item.persisted?
      # @item が保存されていない場合、先に @item を保存する
      results = RakutenWebService::Books::Book.search(isbn: @item.isbn)

      @item = Item.new(read(results.first))
      @item.save
    end

    # 本棚に保存
    if params[:type] == 'Addto'
      current_user.addto(@item)
      flash[:success] = '本棚に追加しました。'
      
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:item_id])

    if params[:type] == 'Addto'
      current_user.unaddto(@item) 
      flash[:success] = '本棚から削除しました。'
      
      redirect_back(fallback_location: root_path)
    end 
  end
end