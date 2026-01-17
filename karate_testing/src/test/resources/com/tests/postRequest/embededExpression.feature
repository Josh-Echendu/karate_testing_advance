Feature: To learn the use of Embedded Expression

Scenario: To create job entry in Json format using embeded expression
    Given url 'https://httpbin.org/post'
    * def role = 'web developer'
    * def getRandomValue = function(){ return Math.floor(100 * Math.random()) }
    And request { "name": "#(getRandomValue())", "role": "#(role)" }
    When method post
    Then status 200
    And print 'response => ', response
    And match response.json.role == 'web developer'


Scenario: To create job entry in XML format using embeded expression
    * url 'https://httpbin.org/post'
    * def name = "Joshua"
    * def getRandomValue = function() { return Math.floor(100 * Math.random()); }
    And request
    """
        <?xml version="1.0" encoding="UTF-8"?>
        <note>
            <to>#(name)</to>
            <from>#(getRandomValue())</from>
            <heading>Reminder</heading>
            <body>Don't forget me this weekend!</body>
        </note>
    """
    And header Accept = 'application/xml'
    When method post
    Then status 200
    And print "response ==> ", response
    And match response.data contains """<to>joshua</to>"""
