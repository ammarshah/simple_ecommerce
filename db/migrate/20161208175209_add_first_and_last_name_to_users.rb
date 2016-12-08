class AddFirstAndLastNameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :firstname, :string, null: false
  	add_column :users, :lastname, :string, null: false

  	remove_column :users, :name
  end
end
