class AddCartIdToCartItemPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_item_prices, :cart_id, :integer
  end
end
