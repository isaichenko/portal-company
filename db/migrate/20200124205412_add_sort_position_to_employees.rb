class AddSortPositionToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :sort_position, :integer
  end
end
