class ChangeEmailInStudents < ActiveRecord::Migration[7.2]
  def change
    change_column_null :students, :email, false
    change_column_null :students, :encrypted_password, false
  end
end
