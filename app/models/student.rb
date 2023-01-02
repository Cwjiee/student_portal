class Student < ApplicationRecord
    has_many :enrollments
    has_many :courses, through: :enrollments 
    has_many :submissions
    has_many :assignments, through: :submissions
    #validates  :student_id, presence: true
    #validate :validates_student_id, :validates_faculty, :validates_field_of_study
    
end
