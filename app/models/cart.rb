class Cart < ApplicationRecord

	belongs_to :user
	has_many :cart_item_prices, dependent: :destroy
	has_many :item_prices, through: :cart_item_prices

end
