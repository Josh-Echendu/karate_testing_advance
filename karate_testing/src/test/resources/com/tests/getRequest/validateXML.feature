Feature: Validate XML Response

# Background:
#     * url 'http://www.nbp.pl/kursy/xml/LastA.xml'
#     * print 'joshua'

Feature: Test XML API

Scenario: Get currency rates from NBP
        # <!-- Create new user account -->
        # <createUserRequest>
        #     <userDetails>
        #         <firstName>John</firstName>
        #         <lastName>Doe</lastName>
        #         <email>john.doe@example.com</email>
        #         <!-- Optional fields -->
        #         <phoneNumber>+1-555-0123</phoneNumber>
        #         <department>Engineering</department>

        #          preferences node is a list
        #         <preferences>
        #             <preferences>true</preferences>
        #             <preferences>dark</preferences>
        #         </preferences>
        #        <project>
        #            <project>
        #                <projectName>Movie App</projectName>
        #                <technology>
        #                    <technology>Kotlin</technology>
        #                    <technology>SQL Lite</technology>
        #                    <technology>Gradle</technology>
        #                </technology>
        #            </project>
                  
        #        </project>

        #     </userDetails>

        # </createUserRequest>

        And match response/createUserRequest/userDetails/firstName == 'John'
        And match response/createUserRequest/userDetails/lastName == 'Doe'

        # in json array index starts from Zero(0) while in xml, index starts from one(1)
        And match response/createUserRequest/userDetails/preferences/preferences[1] == 'true'
        And match response/createUserRequest/userDetails/preferences/preferences[2] == 'dark'
        And match response/createUserRequest/userDetails/project/project/projectName == 'Movie App'
        And match response/createUserRequest/userDetails/project/project/technology/technology[2] == 'SQL Lite'

        # Using the Dot "." operator, we use Json array and it index starts from zero(0)
        And match response.createUserRequest.userDetails.preferences.preferences[0] == 'true'
        And match response.createUserRequest.userDetails.preferences.preferences[1] == 'dark'

        # using wild cards
        And match response.createUserRequest.userDetails.preferences.preferences[*] contains ['true', 'dark']



