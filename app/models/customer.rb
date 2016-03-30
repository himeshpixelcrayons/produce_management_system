class Customer < ActiveRecord::Base

	has_many :orders, dependent: :destroy
	validates :first_name, :last_name, :street, :city, :cellphone, :email, presence: true

	def name
		"#{self.first_name} #{self.last_name}"
	end

	def state_name
		state_name = CS.states(:us)[ self.try(:state).try(:to_sym) ]
	end

	def address
		"#{street}, #{city}, #{state}, #{zip}"
	end

	def undelivered_orders
		self.orders.where(is_delivered: false)
	end

	def delivered_orders
		self.orders.where(is_delivered: true)
	end

	def uninvoiced_orders
		orders = Array.new
		self.orders.each do |order|
			orders << order if order.try(:delivery) and !order.try(:delivery).try(:invoice)
		end
		orders
	end

end