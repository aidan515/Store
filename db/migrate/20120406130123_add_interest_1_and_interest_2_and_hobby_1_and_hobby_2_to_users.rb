class AddInterest1AndInterest2AndHobby1AndHobby2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :interest_1, :string

    add_column :users, :interest_2, :string

    add_column :users, :hobby_1, :string

    add_column :users, :hobby_2, :string

  end
end
