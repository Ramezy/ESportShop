class ProductController < ApplicationController
  def index
    @product_collection = Product.order(:name)
  end

  # GET /product/:id
  def show
    @product = Product.find(params[:id])
  end
end
