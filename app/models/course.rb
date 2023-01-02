class Course < ApplicationRecord
    has_many :enrollments
    has_many :students, through: :enrollments
    has_many :lecturers
    has_many :assignments
    has_many :submissions, through: :assignments

    def student_with_submission
      @student.includes(:submissions).where(id: [nil, '']).or.where(:assignment_id).references(:submissions)
    end
end
