class OrderLinesController < ApplicationController
  def create
    @order = current_order
    
    @order_line = @order.order_lines.find_by_product_id(params[:order_line][:product_id])
    if @order_line
      @order_line.qty += params[:order_line][:qty].to_i
      @order_line.save
    else
      @order_line = @order.order_lines.new(order_line_params)
    end
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.update_attributes(order_line_params)
    @order_lines = @order.order_lines
    @order.save
  end

  def destroy
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.destroy
    @order_lines = @order.order_lines
    @order.save
  end

private
  def order_line_params
    params.require(:order_line).permit(:qty, :product_id)
  end
end
