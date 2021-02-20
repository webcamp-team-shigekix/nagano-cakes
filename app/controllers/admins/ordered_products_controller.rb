class Admins::OrderedProductsController < ApplicationController
  def update
    @ordered_product = OrderedProduct.find(params[:id])
    if @ordered_product.update(prod_params)
      flash[:notice] = "制作ステータスを変更しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def prod_params
    params.require(:ordered_product).permit(:production_status)
  end


end
