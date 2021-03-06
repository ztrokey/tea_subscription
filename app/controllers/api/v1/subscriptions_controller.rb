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

  def update
    subscription = Subscription.find(params[:id])
    subscription.status = 'canceled'
    render json: SubscriptionSerializer.new(subscription), status: 202
  end

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: 200
  end

  private

  def subscription_params
    params.permit(:title, :price, :frequency, :tea_id)
  end
end
