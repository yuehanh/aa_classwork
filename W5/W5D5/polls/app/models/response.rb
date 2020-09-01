# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  respondent_id    :integer          not null
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
    belongs_to :answer_choice
    belongs_to :respondent, class_name: :User
end
