class CreateLecturers < ActiveRecord::Migration[7.0]
  def change
    create_table :lecturers do |t|
      t.string :course_id
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
