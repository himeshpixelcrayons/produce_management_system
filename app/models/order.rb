class Order < ActiveRecord::Base
	has_many :order_items
	has_many :products, through: :order_items

	accepts_nested_attributes_for :products, allow_destroy: true
end
