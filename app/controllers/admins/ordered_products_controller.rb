class Admins::OrderedProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @ordered_product = OrderedProduct.find(params[:id])
    if @ordered_product.update(prod_params)
      if @ordered_product.production_status == 2
        @ordered_product.order.update(order_status: 2)
        flash[:notice] = "制作ステータスが「製作中」となったため注文ステータスが「製作中」に更新されました"
      elsif OrderedProduct.where(order_id: @ordered_product.order.id).count == OrderedProduct.where(order_id: @ordered_product.order.id).where(production_status: 3).count
        @ordered_product.order.update(order_status: 3)
        flash[:notice] = "制作ステータスが全て「製作完了」となったため注文ステータスが「発送準備中」に更新されました"
      else
        flash[:notice] = "制作ステータスを変更しました"
      end
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def prod_params
    params.require(:ordered_product).permit(:production_status)
  end


end
