class OrdersController < ApplicationController

  def new
    @order = current_cart.order
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  def create
    @order = current_cart.order

    if @order.update_attributes(order_params.merge(status: :open))
      session[:cart_token] = nil
      respond_to do |format|
       format.html { redirect_to root_path, notice: 'Order successfully submitted' } 
      end
    else
      render :new
    end


  end

  def open
    @orders = Order.where(status: :open)
    render action: :index
  end

  def ready
    @order = Order.find_by_id(params[:id])
    @order.update_attributes(status: :payment)
    redirect_to open_orders_path
  end

  def complete
    @order = Order.find_by_id(params[:id])
    @order.update_attributes(status: :complete)
    redirect_to payment_orders_path
  end

  def payment
    @orders = Order.where(status: :payment)
    render action: :payment
  end


  private

  def order_params
    params.require(:order).permit(:table)
  end
end
