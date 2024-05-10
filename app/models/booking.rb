class Booking < ApplicationRecord
  belongs_to :residence
  belongs_to :user
  has_one :chat
  has_one :rating
end
