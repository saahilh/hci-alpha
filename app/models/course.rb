class Course < ApplicationRecord
	has_many :questions, dependent: :destroy
	belongs_to :lecturer
end
