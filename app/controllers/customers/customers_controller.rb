class Customers::CustomersController < ApplicationController
    def show
        @customer = current_customer
    end
    
    def unsubscribe
    end
    
    def withdraw
        customer = current_customer
        if customer.is_deleted == false
            customer.update(is_deleted: true)
            redirect_to root_path
        else
            customer.update(is_deleted: false)
            redirect_to root_path
        end
    end
end
