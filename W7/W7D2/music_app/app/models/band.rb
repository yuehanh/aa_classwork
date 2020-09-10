class Band < ApplicationRecord
    has_many :albums, dependent: :destroy


end
