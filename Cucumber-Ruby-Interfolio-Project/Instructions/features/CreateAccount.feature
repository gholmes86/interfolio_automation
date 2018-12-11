Feature: Create Account test


  @newAccount
  Scenario: User able to successfully create an account and upload an image
    When the user navigates to the Interfolio page
    And the user create a new user account
    Then the account should successfully be created
    When the user clicks the home button
    And the user selects the Materials link in the account page
    And the user uploads a document
    Then the document should be successfully uploaded



