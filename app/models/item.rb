class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :item_images,dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :conditon
  belongs_to_active_hash :shopping_charges
  belongs_to_active_hash :days_to_delivery
end
