class Oder < ApplicationRecord
	belongs_to :user
	belongs_to :product
	has_many :items
end
