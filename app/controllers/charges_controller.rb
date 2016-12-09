class ChargesController < ApplicationController
  def new
  	@amount = current_order.total
  end

  def create
	  # Amount
	  @amount = current_order.total
	  
	  # Amount in cents
	  @amount_in_cents = current_order.total * 100

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount_in_cents.to_i,
	    :description => 'Simple e-commerce payment',
	    :currency    => 'usd',
      :metadata    => { user_email: current_user.email, order_id: current_order.id }
	  )

    session.delete(:order_id)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
