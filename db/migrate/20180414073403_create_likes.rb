class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :friend_id
      t.integer :taste_id

      t.timestamps
    end
  end
end
