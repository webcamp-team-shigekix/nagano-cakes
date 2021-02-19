class HomesController < ApplicationController
  def top
    @products = Product.last(4)
    @product_types = ProductType.all
  end

  def about
  end
end
