class Comment < ApplicationRecord
    validates :content, :post_id, :author_id, presence: true

    belongs_to :author, class_name: :User
    belongs_to :post
    belongs_to :comment, foreign_key: :parent_comment_id, optional: true
    has_many :child_comments, foreign_key: :parent_comment_id, class_name: :Comment
end
