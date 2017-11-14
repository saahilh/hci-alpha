class QuestionsController < ActionController::Base
	def delete
		question = Question.find(params[:id])
		course = Course.find(question.course.id)
		question.delete
		
		CourseChannel.broadcast_to(course, 
			delete_question: params[:id]
		)
	end

	def in_class
		question = Question.find(params[:id])
		question.update_column(:status, "answered in class")
		
		CourseChannel.broadcast_to(Course.find(question.course.id), 
			in_class: question.id
		)
	end

	def after_class
		question = Question.find(params[:id])
		question.update_column(:status, "will answer after class")
		
		CourseChannel.broadcast_to(Course.find(question.course.id), 
			after_class: question.id
		)
	end

	def thumbsup
		question = Question.find(params[:id])
		question.update_column(:upvotes, question.upvotes + 1)
		
		CourseChannel.broadcast_to(Course.find(question.course.id), 
			thumbsup: question.id,
			count: question.upvotes
		)
	end

	def thumbsdown
		question = Question.find(params[:id])
		question.update_column(:downvotes, question.downvotes + 1)
		
		CourseChannel.broadcast_to(Course.find(question.course.id), 
			thumbsdown: question.id,
			count: question.downvotes
		)
	end
end
