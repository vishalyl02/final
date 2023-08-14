class RegistrationController < ApplicationController
    skip_before_action :authenticate_customer!, only: :create
    def create
      customer = Customer.new(customer_params)
      if customer.save
        render json: { message: 'Customer registered successfully' }, status: :created
      else
        render json: { error: customer.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    private
  
    def customer_params
      params.require(:customer).permit(:email, :password)
    end
  end
  