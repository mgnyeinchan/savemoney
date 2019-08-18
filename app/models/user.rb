class User < ApplicationRecord
	has_secure_password
	has_many :dailyexps
	has_many :dailyexpfadvs
	has_many :advances
	has_many :monthlyaudits
	has_many :savemoneys
end
