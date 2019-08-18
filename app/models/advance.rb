class Advance < ApplicationRecord
	belongs_to :user
	has_many :dailyexpfadvs
end
