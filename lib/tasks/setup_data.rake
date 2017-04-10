task :setup_data => :environment do 

	
	



50.times do 
		user = User.new
		user.email = Faker::Internet.email
		user.password = "secret123"
		user.save
	end

	


end






