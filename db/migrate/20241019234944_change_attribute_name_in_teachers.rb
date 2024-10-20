class ChangeAttributeNameInTeachers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :teachers, :name, false
    change_column_null :teachers, :teacher_id, false
  end
end
