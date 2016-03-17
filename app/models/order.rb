class Order < ActiveRecord::Base

	validates :address, :customer_name, presence: true

	has_many :order_items
	has_many :products, through: :order_items

	accepts_nested_attributes_for :products, allow_destroy: true
end
