class Track < ApplicationRecord
    validates :title, :ord, :album_id, presence: true
    validates :regular, inclusion: { in: [true, false] }

    belongs_to :album
    has_one :band, through: :album
    has_many :notes
end
