Rails.application.routes.draw do
  get 'api/v1/subscriptions', to: 'api/v1/subscriptions#index'
  post 'api/v1/subscriptions', to: 'api/v1/subscriptions#create'
  patch 'api/v1/subscriptions', to: 'api/v1/subscriptions#cancel'
end
