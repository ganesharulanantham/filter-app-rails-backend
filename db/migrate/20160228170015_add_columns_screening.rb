class AddColumnsScreening < ActiveRecord::Migration
  def change
      add_column :screenings, :latitude, :decimal, :precision => 17, :scale => 14
      add_column :screenings, :longitude, :decimal, :precision => 17, :scale => 14
  end
end
