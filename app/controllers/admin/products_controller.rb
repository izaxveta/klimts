class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save ? successful_redirect(product) : failed_redirect
  end

  private
    def product_params
      params.require(:product).permit(
        :name,
        :price,
        :description,
        :quantity,
        :status
      )
    end
end