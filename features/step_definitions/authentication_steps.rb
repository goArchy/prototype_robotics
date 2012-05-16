When /^I click "([^"]*)"$/ do |link_or_button|
  click_on(link_or_button)
end

Then /^I should be on the new user registration page$/ do
  visit "/user/sign_up"
end

When /^I fill in the registration information and press submit$/ do
  fill_in("user_username", :with => "testy")
  fill_in("user_email", :with => "test@example.com")
  fill_in("user_password", :with => "password")
  fill_in("user_password_confirmation", :with => "password")
  click_on("Create")
end

Then /^I should be on the home page$/ do
  current_path.should == "/"
end

Given /^a test user exists$/ do
  Spree::User.create(username: "testy", email: "test@example.com", password: "password", password_confirmation: "password")
end

When /^I am on the user login page$/ do
  visit "/user/sign_in"
end

Given /^a registered user is logged in$/ do
  step %{I should be on the new user registration page}
  step %{I fill in the registration information and press submit}
  step %{I should see "Welcome test@example.com" on the page}
end

