require 'selenium-webdriver'
require 'test/unit'
require_relative '../../../browser'
require_relative '../../../pages/photobox'

include Test::Unit::Assertions

Given(/^I'm on photobox print page$/) do
  @browser.get "https://www.photobox.co.uk/shop/prints"
end

When(/^I look at the print descriptions$/) do
  #elementsOfPrintPage.each {|i| puts i.text}
end

Then(/^All descriptions have the same templates$/) do
  #puts elementsOfPrintPage[1].text.slice("squares")
  if (/squa5res/.match(elementsOfPrintPage[1].text))!=nil
    puts "Hello!"
    else puts "Bye!"
  end

end