task :setup_data => :environment do 

	
	1000.times do
		product = Product.new
		product.name = Faker::Commerce.product_name
		product.price = Faker::Commerce.price(10..1000)
		product.description = Faker::Lorem.paragraph
		product.availabilty = [true,false].sample
		if product.availabilty
			product.stock = Random.rand(1..100)
		else
			product.stock=0
		end

		product.category_id = Category.all.pluck(:id).sample
		product.save
	end



50.times do 
		user = User.new
		user.email = Faker::Internet.email
		user.password = "secret123"
		user.save
	end

	users = User.all
	
		users.each do |user|
			(2..15).to_a.sample.times do 
				cart = Cart.new
				cart.user_id = user.id
					(1..5).to_a.sample.times do
						cart.product_id = Product.all.pluck(:id).sample
						cart.quantity = Random.rand(1..5)
					end
					cart.save
			
						order = Order.new
						order.user_id = user.id
						order.order_number = "DCT-#{Random.rand(1..1000)}"
						order.order_datetime = Faker::Date.backward(365)
						order.save
			end
		end


end






