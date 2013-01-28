class CreateProgressItemDelegates < ActiveRecord::Migration
  def change
    create_table :progress_item_delegates do |t|
      t.integer :progress_item_id
      t.string :progress_item_type
      t.string :status
      t.boolean :active

      t.timestamps
    end
  end
end
