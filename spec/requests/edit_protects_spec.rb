require 'spec_helper'

describe "EditProtects" do
    it "allows users to edit their profile" do
      user = Factory(:user)
      visit new_user_session_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
      # save_and_open_page
      current_path.should eq("/show_user")
      click_link "Edit profile"      
    end
    
    it "does not allow other users to edit your profile" do
      user = Factory(:user)
      visit "/show_user.1"
      click_link "Edit profile"     
    end
end
