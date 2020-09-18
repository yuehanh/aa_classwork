class CreateSingers < ActiveRecord::Migration[5.2]
  def change
    create_table :singers do |t|
      t.string :name
      t.references :band, foreign_key: true
      t.string :logo
      t.text :description

      t.timestamps
    end
    add_index :singers, :logo, unique: true
  end
end
