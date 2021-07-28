
Feature: Tests for the Home Page

  Background: Define URL
    Given url 'https://conduit.productionready.io/api/'

@debug
  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['Gandhi', 'HITLER']
    And match response.tags !contains 'Hitler'

@debug
  Scenario: Get 10 articles from the page
    Given params { limit: 10, offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == 500
