class Post < ApplicationRecord
  belongs_to :sub
  belongs_to :author, class_name: :User
end
