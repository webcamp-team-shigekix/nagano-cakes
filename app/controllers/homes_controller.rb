class HomesController < ApplicationController
  def top
    @products = Product.where(is_active: true).last(4)
    @product_types = ProductType.all
  end

  def about
  end
end
