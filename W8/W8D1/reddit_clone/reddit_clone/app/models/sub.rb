class Sub < ApplicationRecord
    validates :title, :description, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator, class_name: :User
    has_many :post_subs, dependent: :destroy, inverse_of: :post
end
