class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_method_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price
  end

  has_many :items
end
