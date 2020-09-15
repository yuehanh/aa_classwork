class PostSub < ApplicationRecord
    # validates :post_id, uniqueness: { scope: :sub_id }

    belongs_to :post, optional: true
    belongs_to :sub, optional: true
end
