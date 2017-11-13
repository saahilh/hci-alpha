class Course < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :polls, dependent: :destroy
	belongs_to :lecturer
end
