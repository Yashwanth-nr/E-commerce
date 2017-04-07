class Order < ActiveRecord::Base

	belongs_to :user

	has_many :order_line_items

	before_save :update_total_for_order # is a callback which invokes method before object is saved

	after_save :copy_cart_line_items

	after_save :clear_user_cart

	after_save :send_order_confirmation_notification
=begin
	after_save :update_stock


	def update_stock

		orderlineitems = self.order 

		orderlineitems.each do |orderlineitem|
			orderlineitem.updated_stock= 

		end


=end


	def send_order_confirmation_notification

		Notification.order_confirmation(self).deliver!

	end
	


	def update_total_for_order

		calc_total = 0
		user = self.user
		cart_line_items= user.carts 
		cart_line_items.each do |line_item|
			calc_total+= line_item.quantity * line_item.product.price
		end

		self.total = calc_total
	end


	def copy_cart_line_items
		user = self.user #fetch current user
		cart_line_items =user.carts # find all products added to cart by that user
		cart_line_items.each do |line_item|
			order_line_item = OrderLineItem.new #instantiate a new order line item object so that we can copy values to it
			order_line_item.order_id= self.id #assign the order id to order line item object
			order_line_item.product_id= line_item.product_id
			order_line_item.quantity = line_item.quantity
			order_line_item.price = line_item.product.price # as there is no refernce to price in cart object, we find the product via association and then get the price of the product
			order_line_item.save
		end
	end


	def clear_user_cart
		user = self.user
		Cart.where('user_id=?',user.id).delete_all
	end









end
