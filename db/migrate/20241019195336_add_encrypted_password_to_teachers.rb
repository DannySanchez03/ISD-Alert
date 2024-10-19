class AddEncryptedPasswordToTeachers < ActiveRecord::Migration[7.2]
  def change
    add_column :teachers, :encrypted_password, :string, default: "", null: false
  end
end
