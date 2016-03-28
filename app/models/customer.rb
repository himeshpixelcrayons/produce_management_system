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

end