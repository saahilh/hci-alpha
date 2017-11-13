class PollsController < ActionController::Base
	def new
		render "poll_class", locals:{ course: Course.find(params[:id]) }
	end

	def create
		course = Course.find(params[:id])
		poll = Poll.create(question: params[:question], course: course, active: true)

		params.each do |param, value|
			if param.starts_with?("opt")
				Option.create(number: param.gsub("opt", "").to_i, value: value, selected: 0, poll: poll)
			end
		end

		CourseChannel.broadcast_to(course, poll: render_to_string('student_poll', layout: false, locals:{poll: poll}))

		render "active_poll", locals: { course: course, poll: poll }
	end

	def end
		course = Course.find(params[:id])
		poll = Poll.find(params[:poll_id])
		poll.update_column(:active, false)

		CourseChannel.broadcast_to(course, poll_end: true)

		data = poll.options.pluck(:value, :selected)

		headings = data[0]
		values = data[1]

		render 'professor_poll_results', locals: {poll: poll}
	end

	def answer
		poll = Poll.where(course_id: params[:id], active: true).first
		
		option = ""
		params.each do |param|
			if param.starts_with?("opt")
				option = param.gsub("opt", "")
				break
			end
		end

		CourseChannel.broadcast_to(poll.course, answered: true)

		option = Option.find(option)
		option.update_column(:selected, option.selected + 1)
	end
end
