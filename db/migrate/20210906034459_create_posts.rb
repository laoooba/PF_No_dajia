class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :title, null: false
      t.text :body, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
