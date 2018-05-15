class Comment < ApplicationRecord

	belongs_to :review
	belongs_to :admin

	validates :body, presence: true
end
