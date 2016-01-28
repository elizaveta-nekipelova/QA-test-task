Feature: QA test task

  Scenario: Story 1
    Given I'm on home page of euromoneyplc
    When I go to Management team section
    Then Management team page is displayed correctly
    And Verify that the URL of the first image is present

  Scenario: Story 2
    Given I'm on home page of euromoneyplc
    When I go to menu
    Then Euromoney Store link displayed correctly on the menu item
    When I click on Euromoney Store link
    Then Euromoney Store link navigates to the online store
    When I click on View more details link on the book of the month section
    Then Details page is opened
    When I click Add to cart
    Then Book of the month is added to the shopping cart
    And The price of the book is displayed in GBP