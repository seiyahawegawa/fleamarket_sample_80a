class Item < ApplicationRecord
  has_many :item_images
  has_one :purchase
  belongs_to :user
end
