# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Users
photos = ["https://bit.ly/3UKTAGn","https://bit.ly/3WLHhMG", "https://bit.ly/3K6nkIY", "https://bit.ly/3yorKZ2", "https://bit.ly/4bEFblP", "https://bit.ly/4bINTQm", "https://bit.ly/3ULZMOp", "https://bit.ly/3ygZF5O", "https://bit.ly/4bqWqrd", "https://bit.ly/3USGZ4e"]
i = 0;
10.times do

  user1 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
  )

  user2 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
  )

  residence1 = Residence.create!(
    user_id: user1.id,
    title: Faker::Address.community,
    description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
    image: photos.sample,
    address: Faker::Address.full_address,
    price_per_night: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    category: i % 2 == 0 ? "Apartment" : "House"
  )

  booking1 = Booking.create!(
    residence_id: residence1.id,
    user_id: user2.id,
    total_price: 200,
    start_date: Date.new(2024, 5, 15),
    end_date: Date.new(2024, 5, 20),
    status: "confirmed"
  )

  i+=1;
end
