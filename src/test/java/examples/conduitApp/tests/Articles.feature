Feature: Articles

  Background: Define URL
    Given url 'https://conduit.productionready.io/api/'
#    Given path 'users/login'
#    And request { "user": {  "email": "karatebailey@test.com", "password": "KarateTesting" } }
#    When method Post
#    Then status 200
#    * def token = response.user.token
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature') {  "email": "karatebailey@test.com", "password": "KarateTesting" }
    * def token = tokenResponse.authToken

@debug
  Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request { "article": { "taglist": [], "title": "Blabla Blah", "description": "test test", "body": "BODY"}}
    When method Post
    Then status 200
    And match response.article.title == "Blabla Blah"

  Scenario: Create and Delete Article
    Given header Authorization = 'Token ' + token
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

    Given header Authorization = 'Token ' + token
    Given path 'articles',articleId
    When method Delete
    Then status 200

    Given params { limit: 10, offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != "Delete Article"