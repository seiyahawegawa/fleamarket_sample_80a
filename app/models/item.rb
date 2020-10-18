class Item < ApplicationRecord
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :conditon
  belongs_to_active_hash :shiopping_charges
  belongs_to_active_hash :days_to_delivery
end
