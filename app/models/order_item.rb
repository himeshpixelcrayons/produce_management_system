class OrderItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :order

	validates :quantity, :price, :weight, :amount, presence: true
	validate :check_quantity, if: :quantity_changed?

	def check_quantity
		return true unless self.quantity.present? and (self.quantity_was < self.quantity)
		self.errors.add(:quantity, "cannot be greater than ordered quantity for #{self.try(:product).try(:title)}.")
	end
end
