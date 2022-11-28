Feature: Testing post feature

  Background:
    * url "https://6026b761186b4a0017780810.mockapi.io"
    * header Accept = "application/json"
    * def bodyVariable = read("TestBody.json")

  Scenario: POST from mockapi
    Given path "/api/apitesting/v1/transactions"
    And request {"numberTransaction": 381,"name": "Alex","lastName": "Velez","email": "alex@yahoo.com","id": "1"}
    When method post
    Then status 201
    And print response

  Scenario: POST with failed assertion
    Given path "/api/apitesting/v1/transactions"
    And request {"numberTransaction": 381,"name": "Alex","lastName": "Velez","email": "alex@yahoo.com","id": "1"}
    When method post
    Then status 201
    And print response
    And match response == {"numberTransaction": 381,"name": "Alexis","lastName": "Velez","email": "alex@yahoo.com","id": "43"}

  Scenario: POST with passed assertion - Validation in name and id
    Given path "/api/apitesting/v1/transactions"
    And request {"numberTransaction": 381,"name": "Alex","lastName": "Velez","email": "alex@yahoo.com","id": "1"}
    When method post
    Then status 201
    And print response
    And match response == {"numberTransaction": 381,"name": "#string","lastName": "Velez","email": "alex@yahoo.com","id": "#ignore"}

    # Dollar sign is used for referencing to response too.
  Scenario: POST with json file reading for comparison
    Given path "/api/apitesting/v1/transactions"
    And request {"numberTransaction": 381,"name": "Alex","lastName": "Velez","email": "alex@yahoo.com","id": "1"}
    When method post
    Then status 201
    And match $ == bodyVariable
    And print response

    # Reading and saving request BODY into variable.
  Scenario: POST with json file reading for request body
    Given path "/api/apitesting/v1/transactions"
    And def requestBody = read("RequestBody.json")
    And request requestBody
    When method post
    Then status 201
    And print response

    # Reading from anywhere in the project. [VERSION FOUND FOR ME - TUTORIAL DIDN'T WORK]
  Scenario: POST with json file reading from anywhere.
    Given path "/api/apitesting/v1/transactions"
    And def projectPath = karate.properties['user.home']
    And print projectPath
    And def filePath = projectPath + "/IdeaProjects/01 Courses - TM/karate/src/test/resources/data/TestBodyAnywhere.json"
    And print filePath
    And def requestBody = read('file:' + filePath)
    And request requestBody
    When method post
    Then status 201
    And print response

    # Changin values from read file.
  Scenario: POST setting attribut from just read request body.
    Given path "/api/apitesting/v1/transactions"
    And def projectPath = karate.properties['user.home']
    And print projectPath
    And def filePath = projectPath + "/IdeaProjects/01 Courses - TM/karate/src/test/resources/data/TestBodyAnywhere.json"
    And print filePath
    And def requestBody = read('file:' + filePath)
    And request requestBody
    And set requestBody.name = "Snorlax"
    When method post
    Then status 201
    And print response
















