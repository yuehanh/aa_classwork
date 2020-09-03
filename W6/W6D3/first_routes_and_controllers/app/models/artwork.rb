class Artwork < ApplicationRecord
    belongs_to :artist, class_name: :User
    has_many :shared_views, foreign_key: :artwork_id, class_name: :ArtworkShare
    has_many :shared_viewers, through: :shared_views, source: :viewer
end
