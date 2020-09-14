class Title < ApplicationRecord
  belongs_to :sub
  belongs_to :author
end
