class ApplicationController < ActionController::API
  before_action :authenticate_customer!, unless: -> { request.path =~ /^\/api/ }

  private

  def authenticate_customer!
    # Implement your authentication logic here
    # For example:
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      # Authentication successful
    else
      # Authentication failed
      render json: { error: 'Authentication failed' }, status: :unauthorized
    end
  end
end
