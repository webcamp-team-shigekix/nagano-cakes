class HomesController < ApplicationController
  def top
    @products = Product.last(4)
  end

  def about
  end
end
