class Customers::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def show
        @customer = current_customer
    end

    def unsubscribe
    end

    def withdraw
        current_customer.update(is_deleted: true)
        reset_session
        flash[:notice] = "退会しました"
        redirect_to root_path
    end
end
