class CreateItemHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_histories do |t|
      t.integer :item_price_id
      t.integer :history_id
      t.integer :count
      t.integer :item_price
      t.text :message

      t.timestamps
    end
  end
end
