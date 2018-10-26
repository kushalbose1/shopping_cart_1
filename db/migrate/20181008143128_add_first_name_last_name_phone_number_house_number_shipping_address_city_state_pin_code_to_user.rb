class AddFirstNameLastNamePhoneNumberHouseNumberShippingAddressCityStatePinCodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phonenum, :integer
    add_column :users, :houseno, :integer
    add_column :users, :shippingaddress, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :user_type, :string
    add_column :users, :pincode, :integer
  end
end
