class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.datetime :date
      t.boolean :is_private

      t.timestamps
    end
  end
end
