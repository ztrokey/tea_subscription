class Api::V1::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    elsif params[:tea_id].blank?
      render json: {
        error: 'tea_id cannot be blank',
        status: 422
      }, status: 422
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :frequency, :tea_id)
  end
end
