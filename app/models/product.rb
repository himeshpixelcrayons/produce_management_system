class Product < ActiveRecord::Base
	default_scope { order 'created_at ASC' }
	validates :title, :product_type_id, :quantity, :price, :unit_of_quantity, presence: true

	has_many :order_items
	has_many :orders, through: :order_items

	belongs_to :product_type

	UNIT_OF_QUANTITY = %w( Each Box Case )
end
