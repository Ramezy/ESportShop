class ProductController < ApplicationController
  def index
    @products = Product.all.page params[:page]
  end

  # GET /product/:id
  def show
    @product = Product.find(params[:id])
  end
end
