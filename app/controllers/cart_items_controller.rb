class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @customer = current_customer
    @cart_items = CartItem.where(customer_id: @customer.id)
    @shopping_cart_items = @cart_items.where(category: "shopping")
    @wishlist_cart_items = @cart_items.where(category: "wishlist")
    if params[:category] == "wishlist"
      render "cart_items/wishlist", locals: {cart_items: @wishlist_cart_items}
    end
    @total = 0
    @shopping_cart_items.each do |cart_item|
      @total += price_times_quantity(cart_item)
    end
  end
  def new
    @cart_item = CartItem.new
  end
  def create
    @customer = current_customer
    @cart_item = @customer.cart_items.find_by(product_id: params[:product_id], category: params[:category])
    if @cart_item.nil?
      puts "didn't find anything!!! /n *****************"
      @cart_item = @customer.cart_items.new(product_id: params[:product_id], quantity: 1, category: params[:category])
    else
      @cart_item.quantity += 1
    end
    @cart_item.save
  end

  private
  def cart_item_params
    params.require(:card_item).permit(:customer_id, :product_id, :category)
  end
  def price_times_quantity(cart_item)
    cart_item.quantity * cart_item.product.price
  end
end
