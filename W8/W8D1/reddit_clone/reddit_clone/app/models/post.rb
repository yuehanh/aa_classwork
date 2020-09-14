class Post < ApplicationRecord
    validates :subs, length: { minimum: 1 }

    belongs_to :author, class_name: :User
    has_many :post_subs, dependent: :destroy, inverse_of: :sub
    has_many :subs, through: :post_subs
end
