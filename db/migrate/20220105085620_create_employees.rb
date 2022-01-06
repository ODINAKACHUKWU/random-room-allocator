class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :sex, null: false
      t.string :role, null: false
      t.boolean :require_accommodation, null: false, default: false 

      t.timestamps
    end
  end
end
