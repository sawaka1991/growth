class Taste < ApplicationRecord

	has_many :likes, dependent: :destroy
	has_many :friends, through: :likes
	has_many :item_tastes, dependent: :destroy
	has_many :items, through: :item_tastes

	validates :taste_name, presence: true

end
