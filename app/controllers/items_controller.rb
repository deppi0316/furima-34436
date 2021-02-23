class ItemsController < ApplicationController
  before_action :move_to_session_path, only: :new
  before_action :set_item, only: [:show,:edit,:update,:destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render "edit"
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
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

  def set_item
    @item = Item.find(params[:id])
  end

end