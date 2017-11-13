class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :upvotes
      t.integer :downvotes
      t.string :course

      t.timestamps
    end
  end
end
