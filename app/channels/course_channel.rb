class CourseChannel < ApplicationCable::Channel
	def subscribed
		stream_for Course.where(name: params[:room]).first
	end
end