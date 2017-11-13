class AddSelectedToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :selected, :integer
  end
end
