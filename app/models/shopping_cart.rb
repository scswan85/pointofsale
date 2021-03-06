class ShoppingCart

  delegate :sub_total, to: :order
  delegate :tax, to: :order
  delegate :total, to: :order
  delegate :total, to: :charge

  
  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
      order.sub_total = 0
      order.tax = 0
      order.total = 0
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def orders_count
    order.sum(:quantity)
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.items.find_or_initialize_by(
      product_id: product_id
    )

    order_item.price = product.price
    order_item.quantity = quantity

    ActiveRecord::Base.transaction do
      order_item.save
      update_totals!
    end
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      update_totals!
    end
  end

  private

  def update_totals!
    order.sub_total = order.items.sum('quantity*price')
    order.tax = order.items.sum('(quantity*price)*0.06')
    order.total = order.items.sum('(quantity*price)*1.06')
    order.save
  end
end
