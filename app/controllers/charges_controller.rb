class ChargesController < ApplicationController
  def new
  end

  def create
  # Amount in cents
    @order= Order.find_by_id(params[:id])
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Restaurant customer',
    :currency    => 'usd'
  )
 # redirect_to complete_order_path


  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
  
end
