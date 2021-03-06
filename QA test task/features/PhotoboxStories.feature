Feature: QA test task for Photobox site

  Scenario: Join free
    Given I'm on Photobox home page
    When I click Join now in My photobox dropdown
    Then Join free page is displayed
    When I fill in all required fields with valid data
    And Click Join free button
    Then I should be on home page
    And Logged in


  Scenario: Checking descriptions on print page
    Given I'm on Photobox home page
    When I go to photobox print page
    Then All descriptions have the same templates