class CreateTracks < ActiveRecord::Migration[5.2]
    def change
        create_table :tracks do |t|
            t.integer :album_id, index: { unique: true }

            t.timestamps
        end
    end
end
