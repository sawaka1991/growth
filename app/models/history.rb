class History < ApplicationRecord

	belongs_to :user
	has_many :item_histories, dependent: :destroy
	accepts_nested_attributes_for :item_histories
	has_many :item_prices, through: :item_histories
	enum status: {"news	": 0, "reserve": 1, "finish": 2}
	enum time:{"10:00-11:00": 0,"11:00-12:00": 1,"12:00-13:00": 2,"13:00-14:00": 3,"14:00-15:00": 4,"15:00-16:00": 5,"16:00-17:00": 6,"17:00-18:00": 7,"18:00-19:00": 8}
	validates :reserve_date, presence: true
end
