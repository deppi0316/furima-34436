class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_method
    belongs_to :delivery_area
    belongs_to :delivery_day
  
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_method_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price
  end

  validates :price, numericality: { greater_than: 299, less_than:10000000 , message: "Out of setting range"}
  validates :price, numericality: { only_interger: true ,message: "Half-width number"}
  
  validates :category_id, numericality: { other_than: 1 ,message:"Select"} 
  validates :status_id, numericality: { other_than: 1 ,message:"Select"}
  validates :delivery_method_id, numericality: { other_than: 1 ,message:"Select"}
  validates :delivery_area_id, numericality: { other_than: 1 ,message:"Select"}
  validates :delivery_day_id, numericality: { other_than: 1 ,message:"Select"}

  belongs_to :user
  has_one_attached :image



end
