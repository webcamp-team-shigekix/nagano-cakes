# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
<<<<<<< HEAD
  # before_action :reject_deleted_customer, only: [:create]
=======

>>>>>>> origin/develop

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
<<<<<<< HEAD
  
  # def reject_deleted_customer
  #   customer = Customer.find_by(email:[:customer][:email])
  #   if customer.active_for_authentication? == false
  #     redirect_to root_path
  #   end
  # end
=======
>>>>>>> origin/develop

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
