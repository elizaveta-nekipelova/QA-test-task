require 'selenium-webdriver'
require 'test/unit'
require_relative '../../../browser'
require_relative '../../../photobox_input_data'
require_relative '../../../pages/photobox'
require_relative '../../../email_generation'

include Test::Unit::Assertions

Given(/^I'm on Photobox home page$/) do
  @browser.get "https://www.photobox.co.uk"
end

When(/^I click Join now in My photobox dropdown$/) do
  @browser.mouse.move_to myDropboxMenu
  joinNow_link.click
end

Then(/^Join free page is displayed$/) do
  assert_equal(pageTitle.text, "Join free")
  assert(@browser.current_url.include? "register")
end

When(/^I fill in all required fields with valid data$/) do
  title.find_element(:css,"[value='Miss']").click
  firstNameBox.send_key($firstName)
  lastNameBox.send_key($lastName)
  randomEmail = generateEmail
  email.send_key(randomEmail)
  emailConfirm.send_key(randomEmail)
  password.send_key($password)
  passwordConfirm.send_key($password)
  terms.click
end

And(/^Click Join free button$/) do
  submit.click
end

Then(/^I should be on home page$/) do
  assert_equal(@browser.current_url, "https://www.photobox.co.uk/a/")
end

And(/^Logged in$/) do
  assert_equal(loginName.text, $firstName + " " + $lastName)
  @browser.mouse.move_to myDropboxMenu
  assert(signOut_link.displayed?)
end

