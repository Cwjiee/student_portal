class RenameCourseContent < ActiveRecord::Migration[7.0]
  def change
    rename_column :enrollments, :course, :course_id
  end
end
