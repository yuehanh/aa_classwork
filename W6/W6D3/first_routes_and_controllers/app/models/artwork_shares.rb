class ArtworkShare < ApplicationRecord
    validates [:viewer_id, :artwork_id], uniqueness: true
    
    belongs_to :artwork
    belongs_to :viewer, class_name: :User
end