class Size < ApplicationRecord

	has_many :item_prices, dependent: :destroy
	has_many :items, through: :item_prices

	validates :size_name, :diameter, presence: true
end
