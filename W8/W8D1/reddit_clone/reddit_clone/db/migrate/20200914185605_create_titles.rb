class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :url
      t.text :content
      t.references :sub, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
