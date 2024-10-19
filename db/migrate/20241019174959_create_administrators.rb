class CreateAdministrators < ActiveRecord::Migration[7.2]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :school_name
      t.integer :administrator_id

      t.timestamps
    end
  end
end
