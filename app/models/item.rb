class Item < ApplicationRecord

  # belongs_to :category
  # belongs_to :user
  # has_many :item_images,dependent: :destroy
  # has_many :messages, dependent: :destroy
  # accepts_nested_attributes_for :item_images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :conditon
  belongs_to_active_hash :shopping_charges
  belongs_to_active_hash :days_to_delivery

  validates :item_images, presence: true, length: { maximum: 10 }
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :conditon_id, presence: true
  validates :shopping_charges_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_delivery_id, presence: true
  validates :price,presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  has_many :item_images,dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :messages, dependent: :destroy
end
