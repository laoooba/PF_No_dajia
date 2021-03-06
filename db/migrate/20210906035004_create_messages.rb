class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :content, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
