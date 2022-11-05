json.extract! lecturer, :id, :course_id, :email, :name, :created_at, :updated_at
json.url lecturer_url(lecturer, format: :json)
