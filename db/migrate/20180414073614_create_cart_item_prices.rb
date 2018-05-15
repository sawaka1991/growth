class CreateCartItemPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_item_prices do |t|
      t.integer :item_price_id
      t.integer :count
      t.text :message

      t.timestamps
    end
  end
end
