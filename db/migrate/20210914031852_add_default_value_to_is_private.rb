class AddDefaultValueToIsPrivate < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :is_private, :boolean, default: false
  end

  def down
    change_column :posts, :is_private, :boolean
  end
end
