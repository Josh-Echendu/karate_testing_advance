Feature: Demonstrate POST requests with JSON and XML by reading file

########################################################
# JSON POST Example
########################################################
Scenario: Echo JSON via httpbin
    Given url 'https://httpbin.org/post'
    * def body = read('classpath:com/tests/jsonXmlFolder/JsonResponse2.json')
    And request body
    And headers { 'Content-Type': 'application/json' }
    When method post
    Then status 200
    And print 'JSON Response:', response

    # Verify response JSON
    And match response.json contains deep { "name": "joshua", "role": "tester" }
    And match response.json.name == 'joshua'
    And match response.json.role == 'tester'



Scenario: To get the data in xml format and validate from file 
    * url 'https://httpbin.org/post'
    * def body = read('classpath:com/tests/jsonXmlFolder/XmlResponse.xml')
    And request body
    And header Accept = 'application/xml'
    When method post
    Then status 200
    And print "from xml file ==> ", body
    And print "response ==> ", response