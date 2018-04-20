class OrderItemsController < ApplicationController

  def index
    @items = current_cart.order.items
  end
  
  def create

    respond_to do |format|
      if params[:quantity].to_i >0
        current_cart.add_item(
          product_id: params[:product_id],
          quantity: params[:quantity]    
        )
        format.html { redirect_to root_path, notice: 'Shopping cart successfully updated' }
      else
        format.html { redirect_to root_path, notice: 'Zero and negative values not allowed' }
      end
    end
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to cart_path
  end
end
