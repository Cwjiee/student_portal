class AddLecturerToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lecturer, :boolean, default: false
  end
end
