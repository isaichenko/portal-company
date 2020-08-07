class RenameAdminsToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :admins, :users
  end
end
