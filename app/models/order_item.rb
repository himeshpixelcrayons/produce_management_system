class OrderItem < ActiveRecord::Base
  default_scope { order 'created_at ASC' }
	belongs_to :product
  belongs_to :orderable, polymorphic: true

	validates :quantity, :price, :weight, :amount, presence: true
  validate :check_quantity, if: :quantity_changed?

  before_save :calculate_quantity#, if: "orderable_type == 'Delivery'"

  attr_accessor :order_quantity

	def check_quantity
    invalidate = false
    if self.new_record?
      invalidate = (self.order_quantity.to_f < self.quantity)
    else
      order = self.orderable.order
      order_item = order.order_items.where(product_id: self.product_id).first
      invalidate = ((self.quantity.present? and self.orderable_type == "Delivery") and (order_item.quantity < self.quantity))
    end
		self.errors.add(:quantity, "cannot be greater than ordered quantity for #{self.try(:product).try(:title)}.") if invalidate
	end

	def calculate_quantity
    product = self.product
    product_quantity = product.quantity
    order_item_quantity = self.quantity.try(:to_f)
    quantity_values = self.changes[:quantity].try(:map, &:to_f)
    if quantity_values
      new_quantity = quantity_values.last
      prev_quantity = quantity_values.first
      if new_quantity > prev_quantity
        difference_amount = new_quantity - prev_quantity
        quantity = product_quantity - difference_amount.to_f
      elsif new_quantity < prev_quantity
        difference_amount = prev_quantity - new_quantity
        quantity = product_quantity + difference_amount.to_f
      end
    else
      quantity = product_quantity - order_item_quantity
    end
    product.update(quantity: quantity)
	end
end
