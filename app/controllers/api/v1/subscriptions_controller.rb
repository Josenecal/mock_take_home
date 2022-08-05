class Api::V1::SubscriptionsController < ApplicationController
    def index
        customer_subscriptions = Customer.find(params[:customer_id]).subscriptions
        render json: Api::V1::SubscriptionSerializer.new(customer_subscriptions).serializable_hash
    end

    def create
        customer = Customer.find(new_subscription_params[:customer_id])
        tea = Tea.find(new_subscription_params[:tea_id])
        subscription = Subscription.new(customer_id: customer.id, tea_id: tea.id, title: "#{customer.first_name}'s #{tea.title} subscription", description: "Tea delivered to #{customer.address}", price: Subscription.price_setter(new_subscription_params[:frequency]), frequency: new_subscription_params[:frequency], status: 1)
        if subscription.save!
            render json: Api::V1::SubscriptionSerializer.new(subscription).serializable_hash
        else
            render json: {"error": "Something went wrong"}, status: 500
        end
    end

    def cancel
       subscription =  Subscription.find(cancel_subsctiption_params[:subscription_id])
       subscription.update!(status: "cancelled")
       render json: Api::V1::SubscriptionSerializer.new(subscription).serializable_hash
    end

    private 

    def new_subscription_params
        params.permit(:customer_id, :tea_id, :frequency)
    end

    def cancel_subsctiption_params
        params.permit(:subscription_id)
    end
end
