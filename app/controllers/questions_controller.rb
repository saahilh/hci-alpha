class QuestionsController < ActionController::Base
	def delete
		question = Question.find(params[:id])
		course = question.course.id
		question.delete
		redirect_to "/courses/#{course}/course_page"
	end

	def in_class
		question = Question.find(params[:id])
		question.update_column(:status, "answered in class")
		redirect_to "/courses/#{question.course.id}/course_page"
	end

	def after_class
		question = Question.find(params[:id])
		question.update_column(:status, "will answer after class")
		redirect_to "/courses/#{question.course.id}/course_page"
	end
end
