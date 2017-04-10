task :setup_data => :environment do 

	10.times do
		category = Category.new
		category.name = Faker::Commerce.department(1)
		category.save
	end


end






