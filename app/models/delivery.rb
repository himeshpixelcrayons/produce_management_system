class Delivery < ActiveRecord::Base

	PAYMENT_TYPE = ["Cash", "Debit/Credit Card", "Gift" ]

	belongs_to :order
	has_many :order_items, as: :orderable

	accepts_nested_attributes_for :order_items, allow_destroy: true
end
