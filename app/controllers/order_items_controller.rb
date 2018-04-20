class OrderItemsController < ApplicationController

  def index
    @items = current_cart.order.items
  end
  
  def create
    current_cart.add_item(
      product_id: params[:product_id],
      quantity: params[:quantity].to_i >= 0 ? params[:quantity] : params[:quantity] = nil
    )

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Shopping cart successfully updated' }
    end
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to cart_path
  end
end
