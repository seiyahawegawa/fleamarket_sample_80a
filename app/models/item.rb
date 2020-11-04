class Item < ApplicationRecord

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :conditon
  belongs_to_active_hash :shopping_charges
  belongs_to_active_hash :days_to_delivery

  validate :images_presence
  validates :item_name, :item_description, :category_id, :condition_id, :shopping_charges_id, :prefecture_id, :days_to_delivery_id, :boughtflg_id,:user_id, presence: true

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  

  def images_presence
    if images.attached?
      if images.length > 10
        errors.add(:image, '10枚まで投稿できます')
      end
    else
      errors.add(:image, '画像がありません')
    end
  end
  
end
