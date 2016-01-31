require 'selenium-webdriver'
require "test/unit"
require 'test/unit/assertions'
require_relative '../../../pages/euromoneyplc'
require_relative '../../../pages/euromoneystore'
require_relative '../../../browser'

include Test::Unit::Assertions

When(/^I go to menu$/) do
  navigation_button = @browser.find_element :css => $navigation_button_css
  navigation_button.click
end

Then(/^Euromoney Store link displayed correctly on the menu item$/) do
  $euromoneystore_link = @browser.find_element :css => $euromoneystore_link_css
  assert_not_empty($euromoneystore_link.attribute('href'))
end

When(/^I click on Euromoney Store link$/) do
  @browser.manage.timeouts.implicit_wait = 2
  $euromoneystore_link.click
end

Then(/^Euromoney Store link navigates to the online store$/) do
  @browser.switch_to.window(@browser.window_handles[1])
  advertismentpopup = @browser.find_element :css => $advertismentpopup_close_css
  advertismentpopup.click
  assert_equal(@browser.current_url, "http://store.euromoneyplc.com/")
end

When(/^I click on View more details link on the book of the month section$/) do
  sleep 1
  viewmoredetails_link = @browser.find_element :css => $viewmoredetails_link_css
  viewmoredetails_link.click
end

Then(/^Details page is opened$/) do
  assert_equal(@browser.current_url, "http://store.euromoneyplc.com/product.asp?PositionID=3790&ProductID=18055")
  product_summary = @browser.find_element :css => $product_summary_css
  assert_true(product_summary.displayed?)
  $bookname = @browser.find_element(:css => $bookname_css).text
end

When(/^I click Add to cart$/) do
  addtocart_button = @browser.find_element :css => $addtocart_button_css
  addtocart_button.click
end

Then(/^Book of the month is added to the shopping cart$/) do
  cart_bookname = @browser.find_element :css => $cart_bookname_css
  assert_equal(cart_bookname.text, $bookname)
end

And(/^The price of the book is displayed in GBP$/) do
  selected_currency = @browser.find_element(:css => $currency_css)
  if selected_currency.attribute('selected')
    assert_equal(selected_currency.text, "£")
  end
  totalprice = @browser.find_element :css => $totalprice_css
  assert(totalprice.text.start_with?("£"))
end

