class ChangeScreeningColumnNames < ActiveRecord::Migration
  def change
    change_table :screenings do |t|
      t.rename :actor1, :actor_1
      t.rename :actor2, :actor_2
      t.rename :actor3, :actor_3
    end
    add_column :screenings, :fun_facts, :text
  end
end
