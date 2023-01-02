module SubmissionsHelper
    def submission_graded?(submission)
        !submission.grade.nil?
    end
end
