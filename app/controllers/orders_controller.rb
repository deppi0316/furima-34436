class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_order_datails = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order_order_datail = OrderOrderDatail.new(order_params)
    if @order_order_datail.valid?
      pay_item 
      @order_order_datail.save
      return redirect_to root_path
    else
      @order_order_datails = Item.find(params[:item_id])
      render 'index'
    end
  end


  private
    def order_params
      params.permit(:postal_code,:delivery_area_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      @order_order_datails = Item.find(params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @order_order_datails.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end