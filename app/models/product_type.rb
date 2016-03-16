class ProductType < ActiveRecord::Base
	default_scope { order 'created_at ASC' }
	validates :name, presence: true

	scope :active, -> { where(is_active: true) }
end
