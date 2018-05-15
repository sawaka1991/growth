class ItemHistory < ApplicationRecord

	belongs_to :history, optional: true
	belongs_to :item_price, optional: true
end
