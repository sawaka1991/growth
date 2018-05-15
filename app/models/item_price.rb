class ItemPrice < ApplicationRecord

	has_many :cart_item_prices, dependent: :destroy
	has_many :carts, through: :cart_item_prices
	belongs_to :size
	belongs_to :item
	has_many :item_histories, dependent: :destroy
	has_many :histories, through: :item_histories

	def view_price_and_size
		 self.size.size_name + self.price.to_s + '円'
	end

end
