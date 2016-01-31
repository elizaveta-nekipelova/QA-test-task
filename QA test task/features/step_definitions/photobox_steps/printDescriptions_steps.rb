require 'selenium-webdriver'
require 'test/unit'
require_relative '../../../browser'
require_relative '../../../pages/photobox'

include Test::Unit::Assertions

When(/^I go to photobox print page$/) do
  printLink.click
end

Then(/^All descriptions have the same templates$/) do
  regexp = /([A-Z]{1}[a-zA-z0-9 !’”–#?\.]+\D[\.!]*[a-z]?\n)\b(From £)[\d]{1,2}[\.]{1}[0-9]{1,2}[ ]*\n(> Find out more)/
  elementsOfPrintPage.each {|i| assert(regexp.match(i.text)!=nil)}
end

