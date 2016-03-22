class Delivery < ActiveRecord::Base
	belongs_to :order
	has_many :order_items, through: :order
end
