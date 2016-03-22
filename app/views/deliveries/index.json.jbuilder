json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :order_id, :date_delivered, :payment_type
  json.url delivery_url(delivery, format: :json)
end
