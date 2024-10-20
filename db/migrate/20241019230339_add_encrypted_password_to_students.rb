class AddEncryptedPasswordToStudents < ActiveRecord::Migration[7.2]
  def change
    add_column :students, :encrypted_password, :string, default: "", null: false
  end
end
