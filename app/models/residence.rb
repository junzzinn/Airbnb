class Residence < ApplicationRecord
  belongs_to :user
  has_many :bookings
  include PgSearch::Model

  pg_search_scope :search_by_title_and_address,
   against: [ :title, :address],
   using: {
    tsearch: { prefix: true }
   }
end
