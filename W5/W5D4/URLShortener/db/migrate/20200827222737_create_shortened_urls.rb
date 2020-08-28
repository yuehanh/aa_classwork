class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.text :long_url, null: false
      t.string :short_url
      t.index :long_url, unique: true
      t.index [:short_url, :long_url], unique: true
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
