class Item < ApplicationRecord
  belongs_to :category
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :conditon
  belongs_to_active_hash :shiopping_charges
  belongs_to_active_hash :days_to_delivery
end
