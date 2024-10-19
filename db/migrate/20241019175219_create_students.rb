class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :student_id
      t.integer :class_period
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
