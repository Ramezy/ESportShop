class CartController < ApplicationController
  before_action :initialize_session
  def create
    id = params[:product_id].to_i

    session[:pro_cart] << id unless session[:pro_cart].include?(id)

    redirect_to action: "show"
  end

  def clear
    session[:pro_cart] = []
    redirect_to showcart_path
  end

  def show
    @pro_in_cart = Product.find(session[:pro_cart])
  end

  def destroy
    id = params[:remove_id].to_i

    session[:pro_cart].delete(id)
    redirect_to showcart_path
  end

  def checkout
    number_of_products = params[:product_count].to_i
    @products = []
    @quantities = []
    @total = 0

    number_of_products.times do |i|

      @total += Product.find(params["product_id_#{i}".to_sym].to_i).price * params["quantity_#{i}".to_sym].to_i

      @product_in_stock = Product.find(params["product_id_#{i}".to_sym].to_i)
      @qty = params["qunatity_#{i}".to_sym].to_i

      if @qty > @pro_in_stock.stock
        @error = "Only #{@pro_in_stock.stock} in stock !"

        return redirect_to showcart_path(:error => @error)
      ele
        @pro_in_stock.stock = @pro_in_stock.stock - @qty

        if @pro_in_stock.stock == 0
          @pro_in_stock.is_available = false
        end

        @pro_in_stock.save
        @products << params["product_id_#{i}".to_sym].to_i
        @quantities << params["quantity_#{i}".to_sym].to_i
      end

      session[:pro_cart] = []
      @order_last = Order.all
  end

  private 
    def initialize_session
      session[:pro_cart] || = []
    end

    def helper
      @helper || = Class.new do
        include ActionView::Helpers::NumberHelper
      end.new
    end
end
