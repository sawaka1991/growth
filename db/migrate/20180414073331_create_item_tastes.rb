class CreateItemTastes < ActiveRecord::Migration[5.1]
  def change
    create_table :item_tastes do |t|
      t.integer :taste_id
      t.integer :item_id

      t.timestamps
    end
  end
end
