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






end






