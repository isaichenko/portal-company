class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :mobile_phone1
      t.string :mobile_phone2
      t.string :ip_phone
      t.string :email
      t.string :birthday
      t.string :position
      t.string :avatar
      t.string :department
      t.timestamps
    end
  end
end
