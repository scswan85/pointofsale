class ChargesController < ApplicationController
  def new
  end

  def create
  # Amount in cents
    @order= Order.find(params[:id])
    @amount = (@order.total*100).to_int.to_s
    @order.update_attributes(status: :complete)

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Restaurant customer',
    :currency    => 'usd',
    :receipt_email => params[:stripeEmail]
  )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
end
