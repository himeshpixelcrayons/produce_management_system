class Vendor < ActiveRecord::Base
	has_many :vendor_products, dependent: :destroy
end
