class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :residence, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
