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

i = 0;
10.times do

  user1 = User.create!(
    email: "user1#{i}@example.com",
    password: "password",
    first_name: "John #{i}",
    last_name: "Doe #{i}",
    phone_number: "1234567890",
    birthday: Date.new(1990, 5, 10)
  )

  user2 = User.create!(
    email: "user2#{i}@example.com",
    password: "password",
    first_name: "Jane #{i}",
    last_name: "Smith #{i}",
    phone_number: "9876543210",
    birthday: Date.new(1995, 8, 15)
  )

  residence1 = Residence.create!(
    user_id: user1.id,
    title: "Cozy Apartment #{i}",
    description: "A beautiful and cozy apartment in the heart of the city.",
    image: "https://a0.muscache.com/im/pictures/hosting/Hosting-U3RheVN1cHBseUxpc3Rpbmc6MTEyNjIzMTk3NDU3MjE4Nzg2NA%3D%3D/original/f4cbe542-3ce0-4c6f-a8f1-d2120c1b2420.jpeg?im_w=1440&im_q=highq",
    address: "123#{i} Main St, City",
    price_per_night: 100,
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

  # Create Chats
  chat1 = Chat.create!(
    booking_id: booking1.id
  )

  # Create Messages
  Message.create!(
    user_id: user2.id,
    chat_id: chat1.id,
    message: "Hi, I'm interested in booking your apartment."
  )

  # Create Ratings
  Rating.create!(
    booking_id: booking1.id,
    comment: "Great experience!",
    value: 5,
    user_id: user2.id
  )

  i+=1;
end
