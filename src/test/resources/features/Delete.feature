Feature: Testing post feature

  Background:
    * url "https://6026b761186b4a0017780810.mockapi.io"
    * header Accept = "application/json"
    * def bodyVariable = read("TestBody.json")
    * def id = 1

  Scenario: POST from mockapi
    Given path "/api/apitesting/v1/transactions/" + id
    When method delete
    Then status 200
    And print response