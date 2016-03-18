class Order < ActiveRecord::Base

	has_many :order_items, dependent: :destroy
	has_many :products, through: :order_items, dependent: :destroy
	belongs_to :user
	belongs_to :customer

	accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: proc { |attributes| attributes['quantity'].blank? || attributes['price'].blank? || attributes['weight'].blank? || attributes['amount'].blank? }
end
