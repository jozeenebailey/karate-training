Feature: Sign Up User

  Background: Preconditions
    Given url apiUrl

@debug
  Scenario: New User Sign Up
    Given def userData =  {  "email": "karatejar2@test.com", "username": "karatejar2" }

    Given path 'users'
    And request
    """
      {
        "user": {
          "email": "#(userData.email)",
          "password": "KarateTesting123",
          "username": "#(userData.username)"
         }
       }
    """
    When method Post
    Then status 200
    * def authToken = response.user.token