class RenameItemPriceColumnToItemHistories < ActiveRecord::Migration[5.1]
  def change
  	rename_column :item_histories, :item_price, :price
  end
end
