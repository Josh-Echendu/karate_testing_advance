Feature: To validate the GET End response from file

Background: Set the base url
    * url 'https://bible-api.com'

Scenario: To get the data in JSON format and validate from file 
    Given path 'genesis+1:1'
    And header Accept = 'application/json'
    When method get
    Then status 200

    * def actualResponse = read('JsonResponse.json')
    And match response == actualResponse
    And print "from json file ==> ", actualResponse


Scenario: To get the data in xml format and validate from file 
    * url 'https://www.w3schools.com/xml/note.xml'
    And header Accept = 'application/xml'
    When method get
    Then status 200

    * def actualResponse = read('XmlResponse.xml')
    And match response == actualResponse
    And print "from xml file ==> ", actualResponse
