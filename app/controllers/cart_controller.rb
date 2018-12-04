class CartController < ApplicationController
  before_action :init_session

  def create
    id = params[:product_id].to_i

    session[:pro_cart] << id unless session[:pro_cart].include?(id)

    redirect_to action: "show"
  end

  def clear
    session[:pro_cart] = []
    redirect_to cart_show_path
  end

  def show
    @pro_in_cart = Product.find(session[:pro_cart])
  end

  def destroy
    id = params[:remove_id].to_i

    session[:pro_cart].delete(id)
    redirect_to cart_show_path
  end

  def checkout
    number_of_products = params[:product_count].to_i
    @products = []
    @quantities = []
    @total = 0

    number_of_products.times do |i|

      @total += Product.find(params["product_id_#{i}".to_sym].to_i).productCost * params["quantity_#{i}".to_sym].to_i

      @pro_in_stock = Product.find(params["product_id_#{i}".to_sym].to_i)
      @qty = params["quantity_#{i}".to_sym].to_i

      if @qty > @pro_in_stock.stock
        @error = "Only #{@pro_in_stock.stock} in stock !"

        return redirect_to cart_show_path(:error => @error)
      else
        @pro_in_stock.stock = @pro_in_stock.stock - @qty

        if @pro_in_stock.stock == 0
          @pro_in_stock.is_available = false
        end

        @pro_in_stock.save

        @products << params["product_id_#{i}".to_sym].to_i
        @quantities << params["quantity_#{i}".to_sym].to_i
      end
    end

      @gst_value = 1
      if current_user.province.gst.present?
        @gst_value = current_user.province.gst
        @gst_value = @total.to_d * @gst_value/100
      end

      @pst_value = 1
      if current_user.province.pst.present?
        @pst_value = current_user.province.pst
        @pst_value = @total.to_d * @pst_value/100
      end

      @hst_value = 1
      if current_user.province.hst.present?
        @hst_value = current_user.province.hst
        @hst_value = @total.to_d * @hst_value/100
      end

      @taxes = 0
      @tax_info = "Taxes Charged According to " + current_user.province.name.to_s + "."

      if @gst_value == 1
        @taxes += 0
      else
        @taxes += @gst_value
        @gst_value = helper.number_to_currency(@gst_value)
        @tax_info += "\n" + "GST Charged: " + @gst_value.to_s + "at" + current_user.province.gst.to_s + "%."
      end

      if @pst_value == 1
        @taxes += 0
      else
        @taxes += @pst_value
        @pst_value = helper.number_to_currency(@pst_value)
        @tax_info += "\n" + "PST Charged: " + @pst_value.to_s + "at" + current_user.province.pst.to_s + "%."
      end

      if @hst_value == 1
        @taxes += 0
      else
        @taxes += @hst_value
        @hst_value = helper.number_to_currency(@hst_value)
        @tax_info += "\n" + "HST Charged: " + @hst_value.to_s + "at" + current_user.province.hst.to_s + "%."
      end

      @grand_total = @total + @taxes
      
      order_status = OrderStatus.find(1)

      order = Order.create(quantity: number_of_products, user_id: current_user.id, order_status_id: order_status.id, total: @total, taxes: @taxes, tax_info: @tax_info, grand_total: @grand_total)

      number_of_products.times do |k|
        sold_price = Product.find(@products[k]).productCost
        ProductOrder.create(quantity: @quantities[k], total: sold_price, product_id: @products[k], order: order)
      end

      session[:pro_cart] = []
      @order_last = order
  end

   
    def init_session
      session[:pro_cart] ||= []
    end

    def helper
      @helper ||= Class.new do
        include ActionView::Helpers::NumberHelper
      end.new
    end

end
