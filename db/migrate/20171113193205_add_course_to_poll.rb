class AddCourseToPoll < ActiveRecord::Migration[5.1]
  def change
    add_reference :polls, :course
  end
end
