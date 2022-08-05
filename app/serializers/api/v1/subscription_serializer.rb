class Api::V1::SubscriptionSerializer
   include JSONAPI::Serializer
   attributes :title, :description, :frequency, :price, :status, :created_at, :updated_at
   set_type :subscription
end