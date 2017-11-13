class QuestionsController < ActionController::Base
	def delete
		question = Question.find(params[:id])
		course = question.course.id
		question.delete
		redirect_to "/courses/#{course}/course_page"
	end
end
