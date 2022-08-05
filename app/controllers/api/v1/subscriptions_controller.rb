class Api::V1::SubscriptionsController < ApplicationController
    def index
        customer_subscriptions = Customer.find(params[:customer_id]).subscriptions
        render json: Api::V1::SubscriptionSerializer.new(customer_subscriptions).serializable_hash
    end
end
