class CheckController < ApplicationController
    def check
      customer = Customer.find_by(email: params[:email])
      if customer && customer.authenticate(params[:password])
        render json: { message: 'Customer authenticated' }
      else
        render json: { error: 'Authentication failed' }, status: :unauthorized
      end
    end
  end
  