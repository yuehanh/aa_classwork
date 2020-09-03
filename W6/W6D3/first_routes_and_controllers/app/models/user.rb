class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    
    has_many :artwork_viewed, foreign_key: :viewer_id, class_name: :artwork_shares
    has_many :shared_artworks, through: :artwork_viewed, source: :artwork
end


