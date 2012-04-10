require 'spec_helper'

describe "UserSignUp" do
  it "signs up a user correctly" do
    user = Factory(:user)
    visit new_user_registration_path
    fill_in "First name", :with => "Foo"
    fill_in "Surname", :with => "Foo"
    fill_in "Email", :with => "foo@bar.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    fill_in "Description", :with => "I fought the law, the law won."
    click_button "Sign up"
   
    current_path.should eq("/show_user.2")
  end

  it "raises an error for incorrect email format" do
    #user = Factory(:user)
    visit new_user_registration_path
    fill_in "First name", :with => "Foo"
    fill_in "Surname", :with => "Foo"
    fill_in "Email", :with => "foobar.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    fill_in "Description", :with => "I fought the law, the law won."
    click_button "Sign up"
    current_path.should eq("/users")
  end
  it "does not have equivalent password confirmations" do
    visit new_user_registration_path
    fill_in "First name", :with => "Foo"
    fill_in "Surname", :with => "Foo"
    fill_in "Email", :with => "foobar.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "sec"
    fill_in "Description", :with => "I fought the law, the law won."
    click_button "Sign up"
    current_path.should eq("/users")
  end
  it "does not have any descriptions" do
    visit new_user_registration_path
    fill_in "First name", :with => "Foo"
    fill_in "Surname", :with => "Foo"
    fill_in "Email", :with => "foobar.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    #fill_in "Description", :with => "I fought the law, the law won."
    click_button "Sign up"
    #save_and_open_page
    current_path.should eq("/users")
  end
  
  it "does not allow you to sign up if your password is too short" do
  #member = Factory(:member)
  visit new_user_registration_path
  fill_in "First name", :with => "Foo"
  fill_in "Surname", :with => "Foo"
  fill_in "Email", :with => "foo@bar.com"
  fill_in "Password", :with => "sec"
  fill_in "Password confirmation", :with => "sec"
  fill_in "Description", :with => "I fought the law, the law won."
  click_button "Sign up"
 #  save_and_open_page
  current_path.should eq("/users")
end
  # Test this separately
  it "does not sign in if the email is not unique" do
    user = Factory(:user)
    visit new_user_registration_path
    fill_in "First name", :with => "Foo"
    fill_in "Surname", :with => "Foo"
    fill_in "Email", :with => "foo1@example.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    fill_in "Description", :with => "I fought the law, the law won."
    click_button "Sign up"
    current_path.should eq("/show_user.2")
  end  
  # page.should have_content("taken")
  
end