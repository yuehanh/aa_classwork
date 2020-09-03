class CreateJoinTableArtworkViewer < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      
      # t.index [:artwork_id, :viewer_id]
      # t.index [:viewer_id, :artwork_id]
    end
    add_index :artwork_shares, :viewer_id
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end
