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

    def successful_redirect(product)
      flash[:success] = "Added new product: #{product.name}"
      redirect_to admin_products_path
    end

    def failed_redirect
      flash[:error] = "Something went wrong."
      redirect_to new_admin_product_path
    end
end