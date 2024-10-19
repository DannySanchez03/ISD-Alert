class AddEmailToTeachers < ActiveRecord::Migration[7.2]
  def change
    add_column :teachers, :email, :string , default: "", null: false
  end
end
