class AddFirstNameAndSurnameAndBirthdayAndDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string

    add_column :users, :surname, :string

    add_column :users, :birthday, :date
    
    add_column :users, :description, :string

  end
end
