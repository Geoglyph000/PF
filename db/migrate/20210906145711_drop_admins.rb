class DropAdmins < ActiveRecord::Migration[5.2]
  def change
    drop_table :admins
    drop_table :end_users
  end
end
