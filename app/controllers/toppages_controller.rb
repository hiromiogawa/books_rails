class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user  = current_user
      @books = Item.includes(:ownerships).where("ownerships.statsu": '読書中').where("ownerships.user_id": current_user).references(:ownerships).limit(5).order("ownerships.updated_at desc")
    end
  end
end
