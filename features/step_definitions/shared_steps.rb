Given(/^I open the app to the home page$/) do
  @app = App.new
  @app.home.load
  expect(@app.home).to be_displayed
end

When(/^I go to the solutions page$/) do
  @app.solutions.load
end

Then(/^the solutions page should display$/) do
  expect(@app.solutions).to be_displayed
end
