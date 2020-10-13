class User < ApplicationRecord
  has_one :profile
  has_one :credit_card
  has_many :purchases
  has_many :items
end
