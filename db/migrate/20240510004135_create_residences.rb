class CreateResidences < ActiveRecord::Migration[7.1]
  def change
    create_table :residences do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :image
      t.string :address
      t.decimal :price_per_night
      t.string :category

      t.timestamps
    end
  end
end
