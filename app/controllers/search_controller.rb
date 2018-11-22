class SearchController < ApplicationController
  def index
  end

  def results

    @products = []

    if params[:query_cat][:category_id].present?
      category = Category.find(params[:query_cat][:category_id])
      @products = category.products.where('productStyle LIKE ?', "%#{params[:q]}%")
    else
      @products = []
    end
  end
end
