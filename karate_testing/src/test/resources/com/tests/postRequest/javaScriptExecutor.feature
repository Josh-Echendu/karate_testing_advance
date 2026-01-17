Feature: To Execute the javascript function

Scenario: Execute Java Script function with and without parameter

    * def getIntValue = function() { return 10; }
    Then print "Function Value => ", getIntValue()
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    Then print "function Random value => ", getRandomValue()
    * def getStringValue = function(arg1) { return "Hello " + arg1; }
    Then print "Function value => ", getStringValue('World')
