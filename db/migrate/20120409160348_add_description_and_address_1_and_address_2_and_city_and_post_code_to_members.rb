class AddDescriptionAndAddress1AndAddress2AndCityAndPostCodeToMembers < ActiveRecord::Migration
  def change
    add_column :members, :description, :string

    add_column :members, :address_1, :string

    add_column :members, :address_2, :string

    add_column :members, :city, :string

    add_column :members, :post_code, :string

  end
end
