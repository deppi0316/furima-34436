class OrderOrderDatail

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid.  Input correctly"}
    validates :delivery_area_id, numericality: { other_than: 1 ,message:"Select"}
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :phone_number, numericality: {only_integer: true, greater_than: 0, less_than:99999999999 , message: "Input only number"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id,token: token)
    OrderDatail.create(postal_code: postal_code,delivery_area_id: delivery_area_id,municipality: municipality, address: address,building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end