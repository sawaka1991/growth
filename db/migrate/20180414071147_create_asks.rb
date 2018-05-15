class CreateAsks < ActiveRecord::Migration[5.1]
  def change
    create_table :asks do |t|
      t.integer :about, null: false
      t.text :body
      t.string :name
      t.string :email
      t.integer :reply, null: false

      t.timestamps
    end
  end
end
