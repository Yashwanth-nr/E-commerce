class Cart < ActiveRecord::Base

	belongs_to :product

	belongs_to :user

	def add_or_update
		user = self.user #user object is created using self(picks from current class) and picks a user

		user_cart_line_items = user.carts # picks all values from carts table of user object

		if user_cart_line_items.pluck(:product_id).include? self.product_id 

			line_item = user_cart_line_items.find_by_product_id(self.product_id)
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)
		else
			self.save
		end
	end


end
