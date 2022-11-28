Feature: Testing GET feature

  Scenario: Test a Sample Get API
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200

  Scenario: Test mock api
    Given url "https://6026b761186b4a0017780810.mockapi.io/api/apitesting/v1/transactions"
    When method GET
    Then status 200

