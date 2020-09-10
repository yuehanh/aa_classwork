class Album < ApplicationRecord
    validates :title, :year, presence: true
    validates :band_id, uniqueness: { scope: :title }

    belongs_to :band
end
