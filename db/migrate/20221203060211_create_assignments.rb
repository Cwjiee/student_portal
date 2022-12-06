class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :course_id
      t.string :title
      t.text :description
      t.integer :marks

      t.timestamps
    end
  end
end
