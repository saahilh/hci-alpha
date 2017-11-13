class CoursesController < ActionController::Base
	def select_course
		course = params[:course_code]

		if(Course.where(name: course).count>0)
			redirect_to "/courses/#{ Course.where(name: course).first.id }"
		else
			render 'message', locals: { msg: "Course not found: #{course}", href: "/index.html" }
		end
	end

	def show
		render 'ask_question', locals: { course: Course.find(params[:id]) }
	end

	def create
		new_course = params[:new_course]
		
		if(new_course.blank?)
			msg = "Error: no name entered"
		elsif(Course.where(name: new_course).count != 0)
			msg = "Error: course already exists"
		else
			course = Course.create(name: new_course, lecturer: Lecturer.find(params[:lecturer_id]))
			msg = "Successfully created course #{course.name}"
		end

		render 'message', locals:{ msg: msg, href: "/lecturers/#{params[:lecturer_id]}" }
	end

	def ask_question
		course = Course.find(params[:id])
		if(!params[:question].blank?)
			question = Question.create(question: params[:question], upvotes: 0, downvotes: 0, status: "pending", course_id: course.id)
			CourseChannel.broadcast_to(course, 
				question: render_to_string('_student_questions', layout:false, locals: {question: question}),
				prof_question: render_to_string('_prof_questions', layout:false, locals: {question: question})
			)
		end
	end

	def course_page
		render 'course_page', locals: {course: Course.find(params[:id]) }
	end

	def delete
		course = Course.find(params[:id])
		lecturer = course.lecturer.id
		Question.where(course_id: course.id).delete_all
		course.delete
		redirect_to "/lecturers/#{lecturer}/"
	end

	def poll
		render 'poll_class', locals:{ course: Course.find(params[:id]) }
	end

	def test_poll
		puts params
	end
end