class AddPollToOption < ActiveRecord::Migration[5.1]
  def change
    add_reference :options, :poll
  end
end
