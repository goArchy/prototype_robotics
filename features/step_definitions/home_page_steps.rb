Given /^I am on the home page$/ do
  visit "/"
  current_path.should == "/"
end

Given /^a article exists named "([^"]*)"$/ do |name|
  Spree::Article.create name: name, description: name
end

Given /^a tutorial exists named "([^"]*)"$/ do |name|
  Spree::Tutorial.create name: name, description: name
end

Given /^a project exists named "([^"]*)"$/ do |name|
  Spree::Project.create name: name, description: name
end

