require 'spec_helper'

describe "MemberSignUps" do
  it "signs in a member correctly" do
    member = Factory(:member)
    visit new_member_registration_path
    fill_in "Name", :with => "Foo"
    fill_in "Email", :with => "foo@bar.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    fill_in "Description", :with => "I fought the law, the law won."
    fill_in "Address 1", :with => "St. Mary's Terrace"
    fill_in "Address 2", :with => "Paddington"
    fill_in "City", :with => "London"
    fill_in "Post code", :with => "00000"
    click_button "Sign up"
   # save_and_open_page
    current_path.should eq("/show_member.2")
  end
  
  it "does not sign if email format is wrong" do
    member = Factory(:member)
    visit new_member_registration_path
    fill_in "Name", :with => "Foo"
    fill_in "Email", :with => "foobar.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    fill_in "Description", :with => "I fought the law, the law won."
    fill_in "Address 1", :with => "St. Mary's Terrace"
    fill_in "Address 2", :with => "Paddington"
    fill_in "City", :with => "London"
    fill_in "Post code", :with => "00000"
    click_button "Sign up"
    current_path.should eq("/members")
  end
  it "does not sign in if description missing" do
  member = Factory(:member)
  visit new_member_registration_path
  fill_in "Name", :with => "Foo"
  fill_in "Email", :with => "foo@bar.com"
  fill_in "Password", :with => "secret"
  fill_in "Password confirmation", :with => "secret"
  #fill_in "Description", :with => "I fought the law, the law won."
  fill_in "Address 1", :with => "St. Mary's Terrace"
  fill_in "Address 2", :with => "Paddington"
  fill_in "City", :with => "London"
  fill_in "Post code", :with => "00000"
  click_button "Sign up"
  #save_and_open_page
  current_path.should eq("/members")
  end
  
  it "does not sign in if passwords do not match" do
  member = Factory(:member)
  visit new_member_registration_path
  fill_in "Name", :with => "Foo"
  fill_in "Email", :with => "foo@bar.com"
  fill_in "Password", :with => "secret"
  fill_in "Password confirmation", :with => "seet"
  #fill_in "Description", :with => "I fought the law, the law won."
  fill_in "Address 1", :with => "St. Mary's Terrace"
  fill_in "Address 2", :with => "Paddington"
  fill_in "City", :with => "London"
  fill_in "Post code", :with => "00000"
  click_button "Sign up"
  #save_and_open_page
  current_path.should eq("/members")
  end
  
  it "does not sign in if password is too short" do
  member = Factory(:member)
  visit new_member_registration_path
  fill_in "Name", :with => "Foo"
  fill_in "Email", :with => "foo@bar.com"
  fill_in "Password", :with => "seet"
  fill_in "Password confirmation", :with => "seet"
  #fill_in "Description", :with => "I fought the law, the law won."
  fill_in "Address 1", :with => "St. Mary's Terrace"
  fill_in "Address 2", :with => "Paddington"
  fill_in "City", :with => "London"
  fill_in "Post code", :with => "00000"
  click_button "Sign up"
  #save_and_open_page
  current_path.should eq("/members")
  end
  
  it "does not sign up if you have no postcode" do
  member = Factory(:member)
  visit new_member_registration_path
  fill_in "Name", :with => "Foo"
  fill_in "Email", :with => "foo@bar.com"
  fill_in "Password", :with => "seet"
  fill_in "Password confirmation", :with => "seet"
  fill_in "Description", :with => "I fought the law, the law won."
  fill_in "Address 1", :with => "St. Mary's Terrace"
  fill_in "Address 2", :with => "Paddington"
  fill_in "City", :with => "London"
  #fill_in "Post code", :with => "00000"
  click_button "Sign up"
  #save_and_open_page
  current_path.should eq("/members")
  end
  # Test this separately
  it "does not sign in if the email is not unique" do
  member = Factory(:member)
  visit new_member_registration_path
  fill_in "Name", :with => "Foo"
  fill_in "Email", :with => "foo1@example.com"
  fill_in "Password", :with => "secret"
  fill_in "Password confirmation", :with => "secret"
  fill_in "Description", :with => "I fought the law, the law won."
  fill_in "Address 1", :with => "St. Mary's Terrace"
  fill_in "Address 2", :with => "Paddington"
  fill_in "City", :with => "London"
  fill_in "Post code", :with => "00000"
  click_button "Sign up"
  #save_and_open_page
  current_path.should eq("/show_member.2")
  # page.should have_content("taken")
  end
  
  
  
end