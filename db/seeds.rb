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
user1 = User.create!(
  email: "user1@example.com",
  password: "password",
  first_name: "John",
  last_name: "Doe",
  phone_number: "1234567890",
  birthday: Date.new(1990, 5, 10)
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password",
  first_name: "Jane",
  last_name: "Smith",
  phone_number: "9876543210",
  birthday: Date.new(1995, 8, 15)
)

# Create Residences
residence1 = Residence.create!(
  user_id: user1.id,
  title: "Cozy Apartment",
  description: "A beautiful and cozy apartment in the heart of the city.",
  image: "https://a0.muscache.com/im/pictures/hosting/Hosting-U3RheVN1cHBseUxpc3Rpbmc6MTEyNjIzMTk3NDU3MjE4Nzg2NA%3D%3D/original/f4cbe542-3ce0-4c6f-a8f1-d2120c1b2420.jpeg?im_w=1440&im_q=highq",
  address: "123 Main St, City",
  price_per_night: 100,
  category: "Apartment"
)

# Create Bookings
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
message1 = Message.create!(
  user_id: user2.id,
  chat_id: chat1.id,
  message: "Hi, I'm interested in booking your apartment."
)

# Create Ratings
rating1 = Rating.create!(
  booking_id: booking1.id,
  comment: "Great experience!",
  value: 5,
  user_id: user2.id
)
