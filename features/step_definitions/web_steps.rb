Then /^I should see "([^"]*)" on the page$/ do |text|
  page.should have_content(text)
end

Then /^show me the page$/ do
  save_and_open_page
end
