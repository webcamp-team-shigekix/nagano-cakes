class Admin::ProductTypesController < ApplicationController
  
  def index
    @product_types = ProductType.all
  end
  
  def create
    
  end
  
  def edit
  end
  
  def update
  end
  
end
