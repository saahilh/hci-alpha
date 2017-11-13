class AddQuestionsToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :questions, index: true
  end
end
