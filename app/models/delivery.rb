class Delivery < ActiveRecord::Base
	belongs_to :order
	has_many :order_items, through: :order

	accepts_nested_attributes_for :order_items, allow_destroy: true
end
