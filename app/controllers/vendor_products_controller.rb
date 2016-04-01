class VendorProductsController < ApplicationController
	before_filter :set_vendor_product, only: [:edit, :update, :destroy]

	def new
		@vendor = Vendor.find(params[:vendor_id])
		@vendor_product = @vendor.vendor_products.build
		respond_to do |format|
			format.js
		end
	end

	def create
		@vendor = Vendor.find(params[:vendor_product][:vendor_id])
		@vendor_product = VendorProduct.new(vendor_product_params)
		@vendor_product.save
		respond_to do |format|
			format.js
		end
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def update
		@vendor = Vendor.find(params[:vendor_product][:vendor_id])
		@vendor_product.update_attributes(vendor_product_params)
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@vendor_product.destroy
		respond_to do |format|
			format.js
		end
	end

	def set_vendor_product
		@vendor_product = VendorProduct.find(params[:id])
		@vendor = Vendor.find(@vendor_product.vendor_id)
	end

	private
		def vendor_product_params
      params.require(:vendor_product).permit(:vendor_id, :title, :price, :unit_of_quantity)
    end
end
