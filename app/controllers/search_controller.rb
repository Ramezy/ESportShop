class SearchController < ApplicationController
  def index
  end

  def results
    @products = Product.where('product.category.name LIKE ?', "%#{params[:q]}%").page(params[:page])
  end
end
