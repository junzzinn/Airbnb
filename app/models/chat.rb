class Chat < ApplicationRecord
  belongs_to :booking, optional: true
  has_many :messages
  has_many :messages, dependent: :destroy
end
