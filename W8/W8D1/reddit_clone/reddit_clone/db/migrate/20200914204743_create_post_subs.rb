class CreatePostSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :post_subs do |t|
      t.references :post, foreign_key: true
      t.references :sub, foreign_key: true

      t.timestamps
    end
      add_index :post_subs, [:post_id, :sub_id], unique:true
  end
end
