class Product < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }

  enum status: [:pre_order, :in_stock, :out_of_stock, :retired]

  def self.total_cash_on_hand
    in_stock.reduce(0) { |total, product| total += (product.quantity * product.price) }
  end

  def self.products_grouped_by_statuses(statuses)
    products = Hash.new
    statuses.each{ |status| products[status] = Product.where(status: status) }
    return products
  end

  def self.display_status(status)
    status.gsub('_', ' ').titleize
  end
end