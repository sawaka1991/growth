class CreateItemPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :item_prices do |t|
      t.integer :size_id
      t.integer :item_id
      t.integer :price

      t.timestamps
    end
  end
end
