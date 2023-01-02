class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.string :student_id
      t.string :assignment_id
      t.integer :grade
      t.string :submission

      t.timestamps
    end
  end
end
