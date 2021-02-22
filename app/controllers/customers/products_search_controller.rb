class Customers::ProductsSearchController < ApplicationController

  def type
    if params[:type] != ""
      @type = ProductType.find(params[:type])
      @products = Product.where(product_type: params[:type], is_active: true).page(params[:page]).per(8)
      render 'customers/products/index'
    else
      redirect_to products_path
    end
  end
end
