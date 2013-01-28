class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.integer :assignee_id
      t.integer :assigner_id
      t.date :due_date
      t.date :start_date
      t.integer :progress_item_delegate_id

      t.timestamps
    end
  end
end
