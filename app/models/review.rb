class Review < ApplicationRecord

	belongs_to :user
	has_many :comments, dependent: :destroy
	belongs_to :item
	attachment :image

	validates :comment, presence: true
end
