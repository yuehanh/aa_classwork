class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.references :album, foreign_key: true
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lytics
      t.boolean :regular, default: true

      t.timestamps
    end
  end
end
