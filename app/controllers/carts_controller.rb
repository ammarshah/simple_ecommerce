class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def show
  	@order_lines = current_order.order_lines
  end
end
