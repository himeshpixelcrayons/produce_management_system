class OrderItem < ActiveRecord::Base
  default_scope { order 'created_at ASC' }
	belongs_to :product
	belongs_to :order
  belongs_to :orderable, polymorphic: true

	validates :quantity, :price, :weight, :amount, presence: true
	#validate :check_quantity, if: :quantity_changed?

  #before_save :calculate_quantity, if: "orderable_type == 'Delivery'"

	def check_quantity
		self.errors.add(:quantity, "cannot be greater than ordered quantity for #{self.try(:product).try(:title)}.") if (self.quantity.present? and !self.new_record? and self.orderable_type == "Delivery") and (self.quantity_was < self.quantity)
	end

	def calculate_quantity
    product = self.product
    product_quantity = product.quantity
    order_item_quantity = self.quantity.try(:to_f)
    quantity_values = self.changes[:quantity].try(:map, &:to_f)
    #binding.pry
    if quantity_values
      new_quantity = quantity_values.last
      prev_quantity = quantity_values.first
      if new_quantity > prev_quantity
        difference_amount = new_quantity - prev_quantity
        quantity = order_item_quantity - difference_amount.to_f
      elsif new_quantity < prev_quantity
        difference_amount = prev_quantity - new_quantity
        quantity = order_item_quantity + difference_amount.to_f
      end
    end
    #binding.pry
    product.update(quantity: quantity)
	end
end
