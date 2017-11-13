class Course < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :lecturer, index: true
  end
end
