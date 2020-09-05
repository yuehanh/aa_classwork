require "action_view"
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = ["red", "blue", "green", "orange", "rainbow"]
    validates :name, :sex, :description, :birth_date, :color, presence: true
    validates :sex, inclusion: {in: ["M","F"]}
    validates :color, inclusion: {in: COLORS}

    def age
        time_ago_in_words(birth_date)
    end

    has_many :cat_rental_requests,
        dependent: :destroy
end
