class PurchaseOrder < ActiveRecord::Base
	has_many :purchase_order_items, dependent: :destroy
	belongs_to :vendor
	accepts_nested_attributes_for :purchase_order_items, allow_destroy: true
end
