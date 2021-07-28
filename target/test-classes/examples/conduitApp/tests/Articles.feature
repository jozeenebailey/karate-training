Feature: Articles

  Background: Define URL
    Given url 'https://conduit.productionready.io/api/'
    Given path 'users/login'
    And request { "user": {  "email": "karatebailey@test.com", "password": "KarateTesting" } }
    When method Post
    Then status 200
    * def token = response.user.token

  Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request { "article": { "taglist": [], "title": "Blabla Blah", "description": "test test", "body": "BODY"}}
    When method Post
    Then status 200
    And match response.article.title == "Blabla Blah"