# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  title      :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Poll < ApplicationRecord
    belongs_to :author, class_name: :User
    has_many :questions
end
