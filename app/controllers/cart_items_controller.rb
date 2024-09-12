class CartItemsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @cart_items = CartItem.where(customer_id: @customer.id)
  end
  def new
    @cart_item = CartItem.new
  end
  def create
    @cart_item = CartItem.find_by(cart_item_params)
    if @cart_item.nil?
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.quantity = 1
    else
      @cart_item.quantity += 1
    end
    @cart_item.save
  end

  private
  def cart_item_params
    params.require(:card_item).permit(:customer_id, :product_id)
  end
end
