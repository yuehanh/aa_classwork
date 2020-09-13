class Band < ApplicationRecord
    has_many :albums, dependent: :destroy
    has_many :tracks, through: :albums

end
