Feature: Articles

  Background: Define URL
    Given url apiUrl
#    Given path 'users/login'
#    And request { "user": {  "email": "karatebailey@test.com", "password": "KarateTesting" } }
#    When method Post
#    Then status 200
#    * def token = response.user.token
#    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
#    * def token = tokenResponse.authToken

@debug
  Scenario: Create a new article
    Given path 'articles'
    And request { "article": { "taglist": [], "title": "Blabla Blah", "description": "test test", "body": "BODY"}}
    When method Post
    Then status 200
    And match response.article.title == "Blabla Blah"

  Scenario: Create and Delete Article
    Given path 'articles'
    And request { "article": { "taglist": [], "title": "Delete Article", "description": "test test", "body": "BODY"}}
    When method Post
    Then status 200
    * def articleId = response.article.slug

    Given params { limit: 10, offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title == "Delete Article"

    Given path 'articles',articleId
    When method Delete
    Then status 200

    Given params { limit: 10, offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != "Delete Article"