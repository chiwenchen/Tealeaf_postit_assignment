class AddPhoneAndEmailToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :integer
  	add_column :users, :email, :string
  	add_column :users, :gender, :string
  end
end
