class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.enabled
    @order_line = current_order.order_lines.new
  end
end
