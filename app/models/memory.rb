class Memory < ApplicationRecord
	attachment :image
	belongs_to :friend
	validates :title, :body, presence: true
end
