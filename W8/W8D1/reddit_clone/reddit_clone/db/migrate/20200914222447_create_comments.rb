class CreateComments < ActiveRecord::Migration[5.2]
    def change
        create_table :comments do |t|
            t.text :content, null: false
            t.references :author, foreign_key: { to_table: :users }, null: false
            t.references :post, foreign_key: true, null: false

            t.timestamps
        end
    end
end
