class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new] # Skip authentication for the 'new' action

  def new
    # Show the subscription plan options to the user
  end

  def create
    begin
      customer = Stripe::Customer.create({
        email: params[:email],
        source: params[:stripeToken],
      })

      subscription = Stripe::Subscription.create({
        customer: customer.id,
        items: [{ price: params[:plan_id] }],
      })

      # Save the subscription details in your database (you need to define a Subscription model and store the relevant data)
      # For example:
      subscription_record = Subscription.create(
        user_id: current_user.id,
        subscription_id: subscription.id,
        plan_id: params[:plan_id],
        status: subscription.status
        # You can add more attributes here as needed
      )

      # Redirect or render a success page
      flash[:success] = "Subscription created successfully!"
      redirect_to subscription_success_path # Change this to your desired page

    rescue Stripe::StripeError => e
      flash[:error] = e.message
      redirect_to new_subscription_path
    end
  end
end
