class Order < ActiveRecord::Base

	has_many :order_items, as: :orderable, dependent: :destroy
	has_many :products, through: :order_items, dependent: :destroy
	has_one :delivery, dependent: :destroy
	belongs_to :user
	belongs_to :customer

	validates :customer_id, presence: true

	accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: proc { |attributes| attributes['quantity'].blank? || attributes['price'].blank? || attributes['weight'].blank? || attributes['amount'].blank? }

	def order_select_value
		"#OD#{self.id}#{self.customer.name}"
	end
end
