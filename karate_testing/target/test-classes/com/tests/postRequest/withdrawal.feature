Feature: ATM Withdrawal Processing

  Background:
    # Dummy terminal & transaction info
    * def secretKey = 'abc123xyz'
    * def terminalCode = 'ATM001'
    * def contractId = 'CONTRACT99'
    * def methodType = 'POST'
    * def merchantCode = 'MERCHANT001'
    * def transactionDate = '2026-01-15'
    * def cardExpiry = '2412'
    * def transactionNumber = '001234'
    * def referenceNumber = 'REF' + transactionNumber
    * def transactionType = '0200'
    * def serviceCode = '100200'
    * def maskedCard = '411111******1234'
    * def transactionAmount = '100000'
    * def timestamp = karate.eval("'" + transactionDate.replaceAll('-', '') + "' + '123456'")
    * def expectedResponse = '00'
    * def transactionCategory = 'WITHDRAWAL'
    * def searchKey = transactionDate.replaceAll('-', '') + transactionType + maskedCard.substring(0,5) + maskedCard.substring(maskedCard.length()-4) + terminalCode + referenceNumber
    
    # Dummy SHA-256 signature function
    * def generateSignature =
    """
    function() {
      var inputString = 'abc123xyzPOSTATM001241200123401020010020411111******1234100000123456';
      var MessageDigest = Java.type('java.security.MessageDigest');
      var HexFormat = Java.type('java.util.HexFormat');
      var bytes = inputString.getBytes('UTF-8');
      var md = MessageDigest.getInstance('SHA-256');
      var digest = md.digest(bytes);
      return HexFormat.of().formatHex(digest);
    }
    """
    * def signature = generateSignature()

  Scenario: Insert Dummy Withdrawal Transaction

    # Dummy SQL payload
    * text sqlInsert =
    """
    INSERT INTO dummy_db.transactions
    (trace_id, request_time, response_time, hashed_card, masked_card, stan, merchant_id, auth_id, transaction_id, reversed,
    message_name, response_code, from_account, to_account, request_amount, response_amount, retrieval_reference_number, transaction_currency_code)
    VALUES
    (NULL, '2026-01-15 09:00:00', '2026-01-15 09:00:01', 'DUMMYHASHEDVALUE1234567890ABCDEF', '411111******1234', '001234', 'M001', NULL, NULL, '0',
    'atm-message', '00', 'DefaultAccount', 'DefaultAccount', '100000', '100000', 'REF001234', '840');
    """
    
    * def requestBody = { query: '#(sqlInsert)' }
    Given url 'http://localhost:8080/api/withdrawals/'

    # Execute POST request
    Given request requestBody
    When method post
    And header Content-Type = 'application/json'
    
    Then status 201
    And match response.message == 'Query executed successfully'

    # Debug output
    * print 'Generated Signature:', signature
    * print 'API Response:', response
