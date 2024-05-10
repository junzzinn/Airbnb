class User < ApplicationRecord
  has_many :residences
  has_many :bookings
  has_many :chats, through: :bookings
  has_many :ratings
  has_many :messages, through: :chats
end
