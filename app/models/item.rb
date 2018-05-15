class Item < ApplicationRecord

	has_many :reviews, dependent: :destroy
	has_many :users, through: :reviews
	has_many :item_prices, dependent: :destroy
	has_many :sizes, through: :item_prices
	has_many :allergies, dependent: :destroy
	has_many :materials, through: :allergies
	has_many :item_images, dependent: :destroy
	has_many :item_tastes, dependent: :destroy
	has_many :tastes, through: :item_tastes
	accepts_nested_attributes_for :item_prices, allow_destroy: true
	accepts_nested_attributes_for :item_tastes, allow_destroy: true
	accepts_nested_attributes_for :allergies
	accepts_attachments_for :item_images, attachment: :image

	enum type:{entremet: 0,puti: 1,other: 2,goots: 3}
	enum status:{販売中: 0,販売中止: 1}
	self.inheritance_column = :_type_disabled

	validates :item_name, :introduction, presence: true


end
