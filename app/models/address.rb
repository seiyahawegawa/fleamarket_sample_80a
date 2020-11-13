class Address < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :address_family_name,
    format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/},
    presence: true
  validates :address_first_name,
    format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/},
    presence: true
  validates :address_family_name_kana,
    format: { with: /\A[ァ-ヶー－]+\z/},
    presence: true
  validates :address_first_name_kana,
    format: { with: /\A[ァ-ヶー－]+\z/},
    presence: true
  validates :post_code,
    format: { with: /\A\d{3}\-?\d{4}\z/},
    presence: true
  validates :prefecture_id,
    format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/},
    presence: true
  validates :city,
    format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/},
    presence: true
  validates :address_line,
    format: { with: /\A([ぁ-んァ-ン一-龥a-zA-Z\d{4}[-]\d{3}[-]\d{3}]|ー)+\z/},
    presence: true
  validates :building_name,
    format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/},
    allow_blank: true
  validates :phone_number,
    format: { with: /\A\d{10}$|^\d{11}\z/},
    allow_blank: true
end