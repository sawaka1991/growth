class ItemImage < ApplicationRecord
	attachment :image
	belongs_to :item
end
