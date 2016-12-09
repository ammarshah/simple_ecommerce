class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@orders = Order.by_user(current_user).placed.order(date: :desc, id: :desc)
  end
end
