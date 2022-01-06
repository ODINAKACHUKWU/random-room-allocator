class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.integer :capacity, null: false
      t.integer :available_space
      t.references :spaceable, polymorphic: true # This will add the 'spaceable_id' and 'spaceable_type' to the table

      t.timestamps
    end
  end
end
