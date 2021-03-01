class OrdersController < ApplicationController
  before_action :move_index
  before_action :set_item,only: [:index,:create]

  def index
    @order_order_datail = OrderOrderDatail.new
    if current_user.id == @item.user_id ||@item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_order_datail = OrderOrderDatail.new(order_params)
    if @order_order_datail.valid?
      pay_item 
      @order_order_datail.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private
    def order_params
      params.require(:order_order_datail).permit(:postal_code,:delivery_area_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      @item = Item.find(params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

    def move_index
      unless user_signed_in?
        redirect_to root_path
      end
    end

    def set_item
      @item = Item.find(params[:item_id])
    end


end