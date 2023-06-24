class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items
  end

  private
  def set_cart
    @cart = current_user.cart || current_user.build_cart
  end
end
