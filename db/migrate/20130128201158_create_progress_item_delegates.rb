class CreateProgressItemDelegates < ActiveRecord::Migration
  def change
    create_table :progress_item_delegates do |t|
      t.integer :delegator_id
      t.string :status
      t.boolean :active

      t.timestamps
    end
  end
end
