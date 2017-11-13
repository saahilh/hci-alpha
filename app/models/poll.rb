class Poll < ApplicationRecord
	belongs_to :course
	has_many :options
end
