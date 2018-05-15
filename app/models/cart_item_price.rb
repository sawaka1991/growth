class CartItemPrice < ApplicationRecord

	belongs_to :cart
	belongs_to :item_price
end
