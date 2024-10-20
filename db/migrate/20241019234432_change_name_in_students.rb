class ChangeNameInStudents < ActiveRecord::Migration[7.2]
  def change
    change_column_null :students, :name, false
    change_column_null :students, :student_id, false
    change_column_null :students, :class_period, false
  end
end
