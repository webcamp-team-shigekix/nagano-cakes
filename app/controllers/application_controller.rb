class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_tax_and_ship


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :phone_number, :postal_code, :address])
  end

  def set_tax_and_ship
    $tax = 1.08
    $ship = 800
  end
end
