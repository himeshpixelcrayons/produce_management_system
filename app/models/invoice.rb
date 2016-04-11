class Invoice < ActiveRecord::Base
	has_many :order_items, as: :orderable, dependent: :destroy
	has_many :products, through: :order_items, dependent: :destroy

	belongs_to :delivery

	accepts_nested_attributes_for :order_items, allow_destroy: true
	validates :delivery_id, :date, presence: true
	validate :check_order_items?

	def check_order_items?
		self.errors.add(:base, "Add quantity, price, weight and amount for order items.") if self.order_items.blank?
	end
end
