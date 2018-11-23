class FilterController < ApplicationController
  def index
  end

  def results
    if params[:query_deal][:deal_id].empty?
      @products = Product.All 
    else
      deal = Deal.find(params[:query_deal][:deal_id])
      @products = deal.products.where(deal_id: deal)
    end
  end
end
