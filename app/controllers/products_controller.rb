class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.enabled
  end
end
