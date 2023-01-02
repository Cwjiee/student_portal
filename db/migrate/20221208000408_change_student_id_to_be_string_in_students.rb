class ChangeStudentIdToBeStringInStudents < ActiveRecord::Migration[7.0]
  def change
    change_column :students, :student_id, :string
  end
end
