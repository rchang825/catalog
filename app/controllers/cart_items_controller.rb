class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @customer = current_customer
    @cart_items = CartItem.where(customer_id: @customer.id)
    @total = 0
    @cart_items.each do |cart_item|
      @total += price_times_quantity(cart_item)
    end
  end
  def new
    @cart_item = CartItem.new
  end
  def create
    @customer = current_customer
    @cart_item = @customer.cart_items.find_by(product_id: params[:product_id])
    if @cart_item.nil?
      @cart_item = @customer.cart_items.new(product_id: params[:product_id], quantity: 1)
    else
      @cart_item.quantity += 1
    end
    @cart_item.save
  end

  private
  def cart_item_params
    params.require(:card_item).permit(:customer_id, :product_id)
  end
  def price_times_quantity(cart_item)
    cart_item.quantity * cart_item.product.price
  end
end
