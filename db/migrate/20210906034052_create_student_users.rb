class CreateStudentUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :student_users do |t|
      t.integer :user_id
      t.string :school_name, null: false
      t.string :major, null: false

      t.timestamps
    end
  end
end
