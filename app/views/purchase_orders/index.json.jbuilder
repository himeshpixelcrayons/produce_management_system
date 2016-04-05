json.array!(@purchase_orders) do |purchase_order|
  json.extract! purchase_order, :id, :date, :due_date, :is_outstanding
  json.url purchase_order_url(purchase_order, format: :json)
end
