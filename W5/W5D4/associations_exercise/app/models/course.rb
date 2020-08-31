    # == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    has_many :enrollments,
        primary_key: :id, #user
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :student
    
    # use belong_to has to appaear before has many
    belong_to :prerequisite,
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: :Course,
        optional: true

    has_many :prerequisite,
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: :Course

    belong_to :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User
end
