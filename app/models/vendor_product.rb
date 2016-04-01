class VendorProduct < ActiveRecord::Base

	default_scope { order 'created_at ASC' }

	UNIT_OF_QUANTITY = %w(Pallets Container Box/Case)
end
