class PurchaseOrderItem < ActiveRecord::Base
	belongs_to :vendor_product
	validates :items_ordered, :items_received, presence: true
	validates :reject_reason, presence: true, if: "items_rejected.present? and items_rejected > 0"
end