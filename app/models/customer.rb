class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :street, :city, :cellphone, presence: true
end

def state_name
  state_name = CS.states(:us)[ self.try(:state).try(:to_sym) ]
end
