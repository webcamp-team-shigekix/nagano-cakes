class HomesController < ApplicationController
  def top
    @products = Product.where(is_active: true).last(4)
  end

  def about
  end
end
