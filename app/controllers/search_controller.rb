class SearchController < ApplicationController
  def index
  end

  def result
    @products = Product.where('productName LIKE ?', "%#{params[:q]}%").page(params[:page])
  end
end
