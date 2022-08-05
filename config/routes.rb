Rails.application.routes.draw do
  get 'api/v1/subscriptions', to: 'api/v1/subscriptions#index'
  post 'api/v1/subscriptions', to: 'api/v1/subscriptions#create'
  delete 'api/v1/subscriptions', to: 'api/v1/subscriptions#delete'
end
