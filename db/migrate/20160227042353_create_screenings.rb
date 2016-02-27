class CreateScreenings < ActiveRecord::Migration
  def change
    create_table :screenings do |t|
      t.string :title
      t.string :locations
      t.integer :release_year
      t.string :production_company
      t.string :actor1
      t.string :actor2
      t.string :actor3
      t.string :director
      t.string :distributor
      t.string :writer

      t.timestamps null: false
    end
  end
end
