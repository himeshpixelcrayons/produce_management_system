class Delivery < ActiveRecord::Base

	PAYMENT_TYPE = ["Cash", "Debit/Credit Card", "Gift" ]

	belongs_to :order
	has_many :order_items, as: :orderable, dependent: :destroy
	has_many :products, through: :order_items, dependent: :destroy
	has_one :invoice, dependent: :destroy

	accepts_nested_attributes_for :order_items, allow_destroy: true
	validates :date_delivered, :order_id, :payment_type, presence: true
	validate :check_order_items?

	after_create :update_is_delivered

	def update_is_delivered
		self.order.update(is_delivered: true)
	end

	def check_order_items?
		self.errors.add(:base, "Add quantity, price, weight and amount for order items.") if self.order_items.blank?
	end
end
