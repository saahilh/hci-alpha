class AddCourseToQuestions < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :courses, :questions
    add_reference :questions, :course
  end
end
