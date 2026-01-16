# # Feature: Json Server CRUD Test

# #   Scenario: create a new post 
# #     Given url 'https://jsonplaceholder.typicode.com/posts'
# #     And request { "title": "json-server", "author": "typicode"}
# #     When method post
# #     Then status 201



# Feature: Json Server CRUD Test

# Background: Setup the Base path
#     * url 'https://jsonplaceholder.typicode.com'
#     And print 'joshua'

# Scenario: To get all the data from application in json format
#     Given path 'posts', 1
#     And header Accept = 'application/json'
#     When method get
#     Then status 200
#     And print 'Response for post 1:', response


# Scenario: To get all the data from application in json format using path variable
#     And path 'posts', 2
#     And header Accept = 'application/xml'
#     When method get
#     Then status 200
#     And print 'Response for post 2:', response

Feature: Server response test

Background:
    * url 'https://bible-api.com'
    * print 'joshua'

Scenario: Get Genesis 1:1
    Given path 'genesis+1:1'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response

Scenario: Get Genesis 1:2
    Given path 'genesis+1:2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
