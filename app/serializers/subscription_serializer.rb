class SubscriptionSerializer
  include JSONAPI::Serializer
  set_type :subscription
  attributes :price, :status, :frequency, :tea
end
