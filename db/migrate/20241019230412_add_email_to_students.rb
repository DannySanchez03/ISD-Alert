class AddEmailToStudents < ActiveRecord::Migration[7.2]
  def change
    add_column :students, :email, :string, default: "", null: false
  end
end
