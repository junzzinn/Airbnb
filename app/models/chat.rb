class Chat < ApplicationRecord
  belongs_to :booking
  has_many :messages
  has_many :messages, dependent: :destroy
end
