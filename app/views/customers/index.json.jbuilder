json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :street, :city, :state, :zip, :country, :city, :landline, :cellphone, :email
  json.url customer_url(customer, format: :json)
end
