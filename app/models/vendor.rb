class Vendor < ActiveRecord::Base
	has_many :vendor_products, dependent: :destroy
	validates :name, :street, :city, :state, :country, :zip, :website, :landline, :email, presence: true
end
