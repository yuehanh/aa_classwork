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
require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end