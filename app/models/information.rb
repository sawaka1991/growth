class Information < ApplicationRecord
		attachment :image
		validates :title, :body, presence: true
end
