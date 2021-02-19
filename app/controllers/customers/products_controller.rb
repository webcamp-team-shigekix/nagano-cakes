class Customers::ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

  def index
    @products = Product.all
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @value)
  end

  private

  def match(value)
    Product.where(product_type_id: value)
  end

  def search_for(how, value)
    case how
    when 'match'
      match(value)
    end
  end
  
end
