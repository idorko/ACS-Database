
namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		@clients = []
		@guides = []
		@cliffs = []
		99.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = "example-#{n+1}@example.com"
			age = rand(95) + 5
			phone = Faker::PhoneNumber.phone_number
			town = Faker::Address.city
			state = Faker::Address.us_state
			referal = Faker::Name.name
			experience = Faker::Lorem.sentence(5)
			client = Client.create!(:first_name => first_name,
										:last_name => last_name,
										:phone => phone,
										:email => email,
										:age => age, 
										:town => town,
										:state => state,
										:referal => referal,
										:experience => experience)
			@clients << client		
			puts "Client: #{client.name} created!"				
		end
		15.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = "example-#{n+1}@example.com"
			age = rand(95) + 5
			phone = Faker::PhoneNumber.phone_number
			certs = Faker::Lorem.sentence(5)
			guide = Guide.create!(:first_name => first_name,
														:last_name => last_name,
														:phonenum => phone,
														:email => email,
														:age => age,
														:certifications => certs)
			@guides << guide 
			puts "Guide: #{guide.name} created!"	
			end			

			
			@cliffs << Cliff.create!(:name => "Otter Cliffs")
			@cliffs << Cliff.create!(:name => "South Wall")
			@cliffs << Cliff.create!(:name => "South Otter")
			@cliffs << Cliff.create!(:name => "South Bubble")
			puts "Cliffs created."

			puts Random.date_between('2012-5-1'..'2012-9-28')

			1000.times do |n| 
				if n%2 == 0
					ampm = "AM"
				else
					ampm = "PM"
				end
				course = Course.create!(:experience => Faker::Lorem.sentence(3),
																:course_type => "Family",
																:date => Random.date_between('2012-5-1'..'2012-9-28'),
																:time => "#{rand(11)+1}:#{rand(5)}#{rand(9)}#{ampm}",
																:contact => Faker::Name.name)
				course.guides << @guides[rand(15)]
				course.clients << @clients[rand(99)]
				course.cliff = @cliffs[rand(4)]
				course.save
				puts "#{n} Course for client: #{course.clients.first.name} and guide: #{course.guides.first.name} at #{course.cliff.name} created."
			end 
	end		
end			
