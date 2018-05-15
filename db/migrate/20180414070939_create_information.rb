class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.string :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
