class Friend < ApplicationRecord

	has_many :memories, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :tastes, through: :likes
	belongs_to :user
	enum group:{family: 0, friends: 1, company: 2, other: 3}
	attachment :image
	accepts_nested_attributes_for :likes, allow_destroy: true

	scope :birthday_month, ->(month) { where("strftime('%m',birthday) = strftime('%m', ?)", month) }
	validates :name, :birthday, presence: true
end
