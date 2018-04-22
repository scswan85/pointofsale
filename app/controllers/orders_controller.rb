class OrdersController < ApplicationController
  access all: {except: [:open, :payment, :ready, :complete]}, user: :all, site_admin: :all

  def new
    @order = current_cart.order
  end

  def show
    @order = Order.find_by_id(params[:id])
    redirect_to payment_orders_path unless @order.status == "payment"
  end

  def create
    @order = current_cart.order
    respond_to do |format|
      if @order.total > 0
        session[:cart_token] = nil
        @order.update_attributes(order_params.merge(status: :open))
        format.html { redirect_to root_path, notice: 'Order successfully submitted' } 
      else
        format.html { redirect_to root_path, notice: 'Cannot submit empty orders' }
      end
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

  def cancel
    @order = Order.find_by_id(params[:id])
    @order.update_attributes(status: :cancelled)
    respond_to do |format|
      format.html { redirect_to open_orders_path, notice:'Order cancelled'}
    end
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
