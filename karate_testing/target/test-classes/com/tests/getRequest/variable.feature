Feature: Variables creation in Karate Framework

# To create a varible we can use any Gherkin keyword to create a variable e.g And, When, Then, Given
# <Gherkin keyword> <def> <variable_name> = <value>

Background: Create and initialize Variables

    # Creating global variables in the Background Block
    * def app_name = "Google"
    * def page_load_timeout = 20


Scenario: To create a variable

# Note: Variables are local to thier scenario
Given def var_int = 10
And def var_string = "Karate"
* def var_array = [1, 2, 3]

Then print "Int Variable ==> ", var_int
And print "String Variable ==> ", var_string
And print "Array varible ==> ", var_array
Then print "Google string ==> ", app_name
Then print "timeout string ==> ", page_load_timeout



Scenario: To create a variable

# Note: Variables are local to thier scenario
Given def var_int = 10
And def var_string = "Karate"
* def var_array = [1, 2, 3]

Then print "Int Variable ==> ", var_int
And print "String Variable ==> ", var_string
And print "Array varible ==> ", var_array
Then print "Google string ==> ", app_name
Then print "timeout string ==> ", page_load_timeout


