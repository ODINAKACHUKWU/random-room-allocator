class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :room_gender_identity, null: false

      t.timestamps
    end
  end
end
