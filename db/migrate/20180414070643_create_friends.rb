class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.date :birthday
      t.string :image_id
      t.integer :class, null: false

      t.timestamps
    end
  end
end
