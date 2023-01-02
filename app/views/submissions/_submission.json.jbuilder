json.extract! submission, :id, :student_id, :assignment_id, :grade, :submission, :created_at, :updated_at
json.url submission_url(submission, format: :json)
