class SearchController < ApplicationController
  def index
  end

  def results
    @products = Product.where('productName LIKE ?', "%#{params[:q]}%").where('productStyle LIKE ?', "%#{params[:q]}%").page(params[:page])
  end
end
