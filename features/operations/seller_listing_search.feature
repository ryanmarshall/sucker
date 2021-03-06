Feature: Seller listing search
  As a library  
  I want to be able to search seller listings  
  Because that has some business value to the user.

  Background:
    Given a worker

  Scenario: Browse a seller's listings
    Given the following parameters:
      """
      Operation   : SellerListingSearch
      SellerId    : A2JYSO6W6KEP83
      """
    When the worker gets a response
    Then the response should be valid
    And the response should have 10 seller listings

  Scenario: Large inventories do not return any results
    Given the following parameters:
      """
      Operation   : SellerListingSearch
      SellerId    : A2H6NH4SQYFZ4M
      """
    When the worker gets a response
    Then the response should be valid
    And the response should have 0 seller listings
    And the response should have 1 error
    And the message of the error should be:
    """
    We did not find any matches for your request.
    """
