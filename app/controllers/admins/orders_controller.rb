class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = OrderedProduct.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_back(fallback_location: root_path)
    else
      render :show
    end

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
