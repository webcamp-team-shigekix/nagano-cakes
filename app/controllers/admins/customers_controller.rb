class Admins::CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        @customer.update(admins_customer_params)
        redirect_to admins_customer_path(params[:id])
    end
    
    private
    
    def admins_customer_params
        params.require(:customer).permit(
            :email,
            :family_name,
            :first_name,
            :family_name_kana,
            :first_name_kana,
            :phone_number,
            :postal_code,
            :address,
            :is_deleted
            )
    end
end
