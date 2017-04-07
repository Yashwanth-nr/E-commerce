class CartsController < ApplicationController
	before_action :authenticate_user!

	
	
	def index

		@lines_items = current_user.carts
	
	end

	def create
		@cart=Cart.new(cart_params)
		@cart.user_id = current_user.id
		if @cart.add_or_update

			redirect_to carts_path, notice:"Successfully added to cart"

	end


	def update
		
		@cart = Cart.find(params[:id])
			if @cart.update_attributes(cart_params)
				redirect_to :back, notice: "successfully updated"
			end
	end


	
	def destroy

		@line_item= Cart.find(params[:id])
		@line_item.destroy
			redirect_to :back, notice: "Removed the prodcr from cart"

		end

	end


	private

	def cart_params
		params[:cart].permit(:product_id,:quantity)
	end



end
