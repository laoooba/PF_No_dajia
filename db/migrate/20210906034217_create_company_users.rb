class CreateCompanyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :company_users do |t|
      t.integer :user_id
      t.string :phone_number
      t.string :company_url

      t.timestamps
    end
  end
end
