class Product < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  enum status: [:'Pre Order', :'In Stock', :'Out of Stock', :'Retired']
end