class DropAndCreatePostSubs < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_subs

    create_table :post_subs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end
      add_index :post_subs, [:post_id, :sub_id], unique:true
      add_index :post_subs, :sub_id
  end
end
