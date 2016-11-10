# By Tony. Steps needed for user testing
Given /the following users exist/ do |users_table|
    User.delete_all
    users_table.hashes.each do |user|
        User.create!(user)
    end
end

Given /^a valid user$/ do
  @user = User.create!({
             :email => "dummy@dummy.com",
             :password => "dummypass",
             :password_confirmation => "dummypass",
             :admin => false
           })
end

Given /^a logged in user$/ do
  @user = User.create!({
             :email => "dummy@dummy.com",
             :password => "dummypass",
             :password_confirmation => "dummypass",
             :admin => false
           })
  visit "/users/sign_in"
  fill_in "user_email", :with => "dummy@dummy.com"
  fill_in "password", :with => "dummypass"
  click_button "Log in"
end

Given /^a logged in user "([^"]*)"$/ do |user_name|
  @user = User.create!({
             :email => user_name << "@dummy.com",
             :password => "dummypass",
             :password_confirmation => "dummypass",
             :admin => false
           })
  visit "/users/sign_in"
  fill_in "user_email", :with => user_name << "@dummy.com"
  fill_in "password", :with => "dummypass"
  click_button "Log in"
end

Given /^I am logged out$/ do
  visit "/users/sign_in"
  click_link("Sign out", match: :first)
end

Given /^I edit password$/ do
  fail "Unimplemented"
end

Given /^"([^\"]*)" logs in with password "([^\"]*)"$/ do |user_email, user_password|
  visit "/users/sign_in"
  visit "/users/sign_in"
  fill_in "user_email", :with => user_email
  fill_in "password", :with => user_password
  click_button "Log in"
end
