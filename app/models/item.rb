class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :derivery_method
  belongs_to :delivery_area
  belongs_to :delivery_day

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

  belongs_to :user
end
