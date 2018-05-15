class Material < ApplicationRecord

	has_many :allergies, dependent: :destroy
	has_many :items, through: :allergies

	validates :material_name, presence: true
end
