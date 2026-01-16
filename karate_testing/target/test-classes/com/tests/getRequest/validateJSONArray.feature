Feature: Validate Json Array

Background:
    * url 'https://bible-api.com'
    * print 'joshua'

    # """
    #     {
    #         "reference": "Genesis 1:2",
    #         "verses": [
    #             {
    #             "book_id": "GEN",
    #             "book_name": "Genesis",
    #             "chapter": 1,
    #             "verse": 2,
    #             "text": "The earth was formless and empty. Darkness was on the surface of the deep and God\u2019s Spirit was hovering over the surface of the waters.\n"
    #             }
    #         ],
    #         "text": "The earth was formless and empty. Darkness was on the surface of the deep and God\u2019s Spirit was hovering over the surface of the waters.\n",
    #         "translation_id": "web",
    #         "translation_name": "World English Bible",
    #         "translation_note": "Public Domain"
    #     }
    # """

Scenario: Validate Json Array
    Given path 'genesis+1:2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response

    # Note: [] == Json Array and {} == Json Object
    And match response.reference == 'Genesis 1:2'

    # to access [], we use [index] while to access {} we use the dot(.) operator 
    And match response.verses[0].book_id == 'GEN'

    # To calculate the size of a Json Array using fuzzy matcher
    And match response.verses == '#[1]'


    # response = [
    #     {
    #         "jobId": 1
    #         "jobTitle": 'software Eng'
    #         "experience": [
    #             "google",
    #             "Apple"
    #         ],
    #         "project": [
    #             {
    #                 "projectName": "Movie App"
    #                 "technology": [
    #                     "Kotlin",
    #                     "SQL Lite",
    #                     "Gradle"
    #                 ]
    #             }
    #         ]
    #     }
    # ]
    
    # And match response.[0].jobId == 1
    # And match response.[0].experience[1] == "Apple"
    # And match response.[0].project[0].projectName == "Movie App"
    # And match response.[0].project[0].technology[0] == 'Kotlin'
    # And match response.[0].project[0].technology[2] == 'Gradle'

    # To check the amount of item
    # And match response.[0].project[0].technology == '#[3]'
    # And match response.[0].experience == '#[2]'

    # Wild card character
    # And match response.[0].project[0].technology[*] contains ["Kotlin", "SQL Lite", "Gradle"]
    # And match response.[0].experience[*] contains ['google', 'Apple']
    # And match response.[*].jobId contains 1



Scenario: Validate Json Array using Fuzzy Matcher
    # response = [
    #     {
    #         "jobId": 1
    #         "jobTitle": 'software Eng'
    #         "experience": [
    #             "google",
    #             "Apple"
    #             "Samsung"
    #         ],
    #         "project": [
    #             {
    #                 "projectName": "Movie App"
    #                 "technology": [
    #                     "Kotlin",
    #                     "SQL Lite",
    #                     "Gradle"
    #                 ]
    #             }
    #         ]
    #     }
    # ]

    # Fuzzy matcher works for both Json Array and xml, but '#array' works for only Json Array and not xml unless it would lead to an error
    And match response.[0].jobId = '#present'
    And match response.[0].experience[1] = '#notnull'
    And match response.[0].experience[1] = '#null'
    And match response.[0].project[0].projectName = '#ignore'
    And match response.[0].project[0].technology = '#array'
    And match response.[0].jobId = '#number'
    And match response.[0].jobTitle = '#string'
    And match response.[0].jobId = '#boolean'

    # advance Fuzzy matcher (#? EXPR), "#": is the pound symbol, "?": which could any existing matcher e.g "#string, #number, #array" etc , "EXPR": is a javascript expression which would either return a true or false
    
    # This checks if JobId is equal to one
    And match response.[0].jobId == '#? _ == 1' 

    # This checks if jobId is not equal to one
    And match response.[0].jobId == '#? _ != 1' 

    # This checks if jobTitle is a string and it length is greater than or equal to one
    And match response.[0].jobTitle == '#string? _.length >= 1'

    # [Num] EXPR

    # to validate if array is equal to 3
    And match response.[0].experience == '#[3]'

    # to validate if array is equal to 3 and each elements is of type string
    And match response.[0].experience == '#[3] #string'

    # to validate if array is equal to 3 and it elements is of type number
    And match response.[0].experience == '#[3] #number'

    # To validate if an array is size 3, a string and it length is greater or equal to 2
    And match response.[0].experience == '#[3] #string? _.length >=2'






