require 'selenium-webdriver'
require_relative '../browser'

#---------------------------------------------------------------------------
# Homepage
#---------------------------------------------------------------------------
def myDropboxMenu
  return @browser.find_element :css => "[class$='pbxIcon userAccount']"
end

def joinNow_link
  @browser.find_element :css => "[class$='site-nav__sub-link site-nav__join-now']"
end

def signOut_link
  @browser.find_element :css => "[class='site-nav__sub-link site-nav__sign-out']"
end

def loginName
  @browser.find_element :css => "[class*=item--userAccount] span:nth-child(2)"
end

#---------------------------------------------------------------------------
# Sign up page
#---------------------------------------------------------------------------
def pageTitle
  return @browser.find_element :css => "#registration .hide-small"
end

def title
  @browser.find_element :css => "#title"
end

def firstNameBox
  @browser.find_element :css => "#first-name"
end

def lastNameBox
  @browser.find_element :css => "#last-name"
end

def email
  @browser.find_element :css => "#email"
end

def emailConfirm
  @browser.find_element :css => "#emailConfirmation"
end

def password
  @browser.find_element :css => "#password"
end

def passwordConfirm
  @browser.find_element :css => "#passwordConfirmation"
end

def terms
  @browser.find_element :css => "#terms"
end

def submit
  @browser.find_element :css => "#submit"
end

