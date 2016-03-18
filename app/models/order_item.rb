class OrderItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :order

	validates :quantity, :price, :weight, :amount, presence: true
end
