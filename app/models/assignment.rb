class Assignment < ApplicationRecord
    belongs_to :course
    has_many :submissions
    has_many :students, through: :submissions
end
