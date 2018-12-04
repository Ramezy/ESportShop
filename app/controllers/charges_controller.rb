class ChargesController < ApplicationController
    def new
        session[:order_id] = params[:id].to_i
        @amount = Order.find(params[:id]).grand_total
        @amount = @amount * 100
        session[:pro_cent_value] = @amount.to_i
    end

    def create
        @amount_pro = session[:pro_cent_value]

        customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
            :source => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
            :customer => customer.id,
            :amount => @amount_pro,
            :description => 'Rails Stripe customer',
            :currency => 'usd'
        )

        if charge.paid && charge.amount == @amount_pro
            @order_id = session[:order_id].to_i

            order = Order.find(@order_id)

            order.charge_id = charge.id
            order.order_status_id = 2

            order.save
        end

    rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end
end
