class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
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