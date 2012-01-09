Given /^a post exists titled "([^"]*)"$/ do |title|
  Post.create title: title
end

Given /^I am on the home page$/ do
  visit root_path
  current_path.should == root_path
end

Then /^I should see "([^"]*)" on the page$/ do |text|
  page.should have_content(text)
end
