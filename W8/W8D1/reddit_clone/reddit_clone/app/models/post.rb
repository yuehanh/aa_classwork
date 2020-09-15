class Post < ApplicationRecord
    validates :subs, length: { minimum: 1 }

    belongs_to :author, class_name: :User
    has_many :post_subs, dependent: :destroy, inverse_of: :post
    has_many :subs, through: :post_subs
    has_many :comments


    def top_comments
        comments.where(parent_comment_id: nil)
    end
end
