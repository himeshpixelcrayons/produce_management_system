class Delivery < ActiveRecord::Base

	PAYMENT_TYPE = ["Cash", "Debit/Credit Card", "Gift" ]

	belongs_to :order
	has_many :order_items, as: :orderable, dependent: :destroy
	has_many :products, through: :order_items, dependent: :destroy

	accepts_nested_attributes_for :order_items, allow_destroy: true

	after_create :update_is_delivered

	def update_is_delivered
		self.order.update(is_delivered: true)
	end
end
