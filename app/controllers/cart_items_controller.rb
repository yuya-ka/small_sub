class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    @item = @cart.cart_items.find_by(product_id: params[:product_id])
    if @item
      @item.quantity += 1
      @item.save
    else
      @item = @cart.cart_items.new(product_id: params[:product_id], quantity: 1)
      @item.save
    end
    redirect_to cart_path(@cart)
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.build_cart
  end
end