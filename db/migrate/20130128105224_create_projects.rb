class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :owner_id
      t.date :due_date
      t.date :start_date

      t.timestamps
    end
  end
end
