class ItemsController < ApplicationController
  before_action :move_to_session_path, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:text,:category_id,:status_id,:delivery_method_id,:delivery_area_id,:delivery_day_id,:price).merge(user_id: current_user.id)
  end

  def move_to_session_path
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end