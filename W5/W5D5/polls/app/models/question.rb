# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer          not null
#
class Question < ApplicationRecord
    belongs_to :poll
    has_many :answer_choices
end
