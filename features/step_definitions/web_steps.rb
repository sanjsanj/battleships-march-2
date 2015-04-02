Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I follow "([^"]*)"$/) do |arg1|
  click_link arg1
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I am on the New Game page$/) do
  visit '/new_game'
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When(/^click on "([^"]*)"$/) do |arg1|
  click_on(arg1)
end

Then(/^I expect to redirect to Start Game page$/) do
  expect(current_path).to eq('/start_game')
end
