task :clear_data => :environment do
=begin	
	Category.delete_all
	Product.delete_all
	Cart.delete_all
	Order.delete_all
	OrderLineItem.delete_all
=end	
	OrderLineItem.delete_all
	User.delete_all
	Order.delete_all
end
