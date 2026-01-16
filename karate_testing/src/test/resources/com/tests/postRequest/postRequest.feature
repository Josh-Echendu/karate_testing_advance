Feature: Demonstrate POST requests with JSON and XML

########################################################
# JSON POST Example
########################################################
Scenario: Echo JSON via httpbin
    Given url 'https://httpbin.org/post'
    And request { "name": "joshua", "role": "tester" }
    And headers { 'Content-Type': 'application/json' }
    When method post
    Then status 200
    And print 'JSON Response:', response
    # Verify response JSON
    And match response.json contains deep { "name": "joshua", "role": "tester" }
    And match response.json.name == 'joshua'
    And match response.json.role == 'tester'

########################################################
# XML POST Example
########################################################
Scenario: Echo XML via httpbin
    Given url 'https://httpbin.org/post'
    And request
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <note>
        <to>Tove</to>
        <from>Jani</from>
        <heading>Reminder</heading>
        <body>Don't forget me this weekend!</body>
    </note>
    """
    And headers { 'Content-Type': 'application/xml' }
    When method post
    Then status 200
    And print 'XML Response:', response
    # Karate returns XML as string in response.data
    And match response.data contains '<to>Tove</to>'
    And match response.data contains '<from>Jani</from>'
