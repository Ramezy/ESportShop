class CategoryController < ApplicationController
  def index
  end

  def results
    cat = Category.find(params[:category])
    @products = cat.products
  end
end
