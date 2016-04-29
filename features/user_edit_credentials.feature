# @author: Zachary McPherson on 4/25/2016
Feature: successfully edit email or password as a logged in user
  
  As an existing user
  I should be able to edit my credentials
  So that I can choose a password without the admin knowing
  
Background:
  Given the following users exist:
    | email             | admin      | created_at           | password     | password_confirmation     |
    | zach@gmail.com    | true       | 2016-03-17 17:44:13  | 12341234     | 12341234                  |
    | tonylee@gmail.com | false      | 2016-03-14 15:32:00  | 43124312     | 43124312                  |
    | jae@berkeley.edu  | false      | 2016-03-18 22:12:11  | 54175417     | 54175417                  |  

  Given a logged in user
  And I am on the CommunityGrows home page
  
  
#happy path 
Scenario: successfully  change password
  When I follow "Account Details"
  Then I am on the account details page for "zach@gmail.com"
  Then I fill in "Password:" with "12245678"
  And I fill in "Password Confirmation:" with "12245678"
  Then I press "Submit"
  Then I am on the account details page for "zach@gmail.com"
  Then I follow "Sign out"
  And I am on the CommunityGrows log_in page
  Then I fill in "user_email" with "zach@gmail.com"
  Then I fill in "user_password" with "12245678"
  And I press "Log in"
  And I should be on the CommunityGrows dashboard page
  
#sad path
Scenario: user fails to fill in required fields
  When I follow "Account Details"
  Then I am on the account details page for "zach@gmail.com"
  And I fill in "Password:" with ""
  And I fill in "Password Confirmation:" with ""
  Then I press "Submit"
  And I should see "Password can't be blank"
  And I should be on the account details page for "zach@gmail.com"