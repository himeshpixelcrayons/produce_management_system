class Invoice < ActiveRecord::Base
	has_many :order_items, as: :orderable, dependent: :destroy
	has_many :products, through: :order_items, dependent: :destroy

	belongs_to :delivery

	accepts_nested_attributes_for :order_items, allow_destroy: true
end
