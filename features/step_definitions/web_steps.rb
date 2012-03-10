Given /^a article exists named "([^"]*)"$/ do |name|
  Article.create name: name, description: name
end

Given /^a tutorial exists named "([^"]*)"$/ do |name|
  Tutorial.create name: name, description: name
end

Given /^a project exists named "([^"]*)"$/ do |name|
  Project.create name: name, description: name
end

Given /^I am on the home page$/ do
  visit root_path
  current_path.should == root_path
end

Then /^I should see "([^"]*)" on the page$/ do |text|
  page.should have_content(text)
end
