class Product < ApplicationRecord
  has_many :cart_items
  has_many :customers, through: :cart_items
end
