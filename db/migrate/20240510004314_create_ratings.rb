class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :comment
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
