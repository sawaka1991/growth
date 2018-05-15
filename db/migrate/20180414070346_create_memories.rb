class CreateMemories < ActiveRecord::Migration[5.1]
  def change
    create_table :memories do |t|
      t.string :image_id
      t.integer :friend_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
