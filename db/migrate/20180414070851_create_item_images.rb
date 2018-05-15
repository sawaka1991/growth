class CreateItemImages < ActiveRecord::Migration[5.1]
  def change
    create_table :item_images do |t|
      t.string :image_id
      t.integer :item_id

      t.timestamps
    end
  end
end
