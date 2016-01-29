require 'selenium-webdriver'
require 'test/unit'
require_relative '../../../pages/euromoneyplc'
require_relative '../../../browser'

Given(/^I'm on home page of euromoneyplc$/) do
  @browser.get "http://www.euromoneyplc.com"
end

When(/^I go to Management team section$/) do
  navigation_button = @browser.find_element :css => $navigation_button_css
  navigation_button.click

  whoweare_link = @browser.find_element :css => $whoweare_link_css
  whoweare_link.click()
  @browser.manage.timeouts.implicit_wait = 2

  managementteam_link = @browser.find_element :css => $managementteam_link_css
  managementteam_link.click
end

Then(/^Management team page is displayed correctly$/) do
  assert_equal(@browser.title, "Management team | Who we are | Euromoney Institutional Investor PLC")
  stand_first = @browser.find_element :css => $stand_first_css
  assert_equal(stand_first.text, "Euromoney is run by an experienced team of corporate and divisional executive directors.")
end

And(/^Verify that the URL of the first image is present$/) do
  first_image = @browser.find_element :css => $first_image_css
  assert(first_image.attribute('src') != nil)
end

