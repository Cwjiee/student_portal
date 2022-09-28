class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :student_id
      t.string :faculty
      t.string :field_of_study

      t.timestamps
    end
  end
end
