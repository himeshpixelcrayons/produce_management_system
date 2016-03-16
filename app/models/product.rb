class Product < ActiveRecord::Base
	default_scope { order 'created_at ASC' }
	validates :title, :product_type_id, :quantity, :price, presence: true
end
