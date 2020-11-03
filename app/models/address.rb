class Address < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :address_first_name, :address_family_name, :address_first_name_kana, :address_family_name_kana, :post_code, :prefecture_id, :city, :address_line, :phone_number, presence: true

end 