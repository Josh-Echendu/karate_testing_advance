Feature: Server response test

Background:
    * url 'https://bible-api.com'
    * print 'joshua'

Scenario: To validate the GET endpoint response
    Given path 'genesis+1:1'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response ==
    """
        {
            "reference": "Genesis 1:1",
            "verses": [
                {
                "book_id": "GEN",
                "book_name": "Genesis",
                "chapter": 1,
                "verse": 1,
                "text": "In the beginning, God created the heavens and the earth.\n"
                }
            ],
            "text": "In the beginning, God created the heavens and the earth.\n",
            "translation_id": "web",
            "translation_name": "World English Bible",
            "translation_note": "Public Domain"
        }
    """


Scenario: To validate the GET endpoint response
    Given path 'genesis+1:2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response !=
    """
        {
            "reference": "Genesis 1:4",
            "verses": [
                {
                "book_id": "GEN",
                "book_name": "Genesis",
                "chapter": 1,
                "verse": 2,
                "text": "The earth was formless and empty. Darkness was on the surface of the deep and God\u2019s Spirit was hovering over the surface of the waters.\n"
                }
            ],
            "text": "The earth was formless and empty. Darkness was on the surface of the deep and God\u2019s Spirit was hovering over the surface of the waters.\n",
            "translation_id": "web",
            "translation_name": "World English Bible",
            "translation_note": "Public Domain"
        }
    """


Scenario: To get the data in JSON and validate a specific property
    Given path 'genesis+1:2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response contains deep { "reference": "Genesis 1:2" }
    And match response contains deep { "verses": [{ "book_name": "Genesis" }] }
    # And match header Content-Type == 'application/json'
    # And match header Connection == 'keep-alive'

 