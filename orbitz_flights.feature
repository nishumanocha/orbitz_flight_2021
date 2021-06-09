Feature: Orbitz flights Search Functionality

  Scenario: verify user is able to search for the avilable flights for a future dates
    Given user is on the orbitz homepage
    When user selects the flights tab
    And user choose round trip option
    And user search for Columbus city and select CMH airport for departure
    And user search for Cleveland city and select CLE airport for arrival
    And user choose future dates for the arrival and departure dates
    And search for the available flights
    Then verify user should see the available flights
    And verify user gets the flights results for the selected dep date


  Scenario Outline: verify user is able to search for the available flights for a future dates for diffrent destinations
    Given user is on the orbitz homepage
    When user selects the flights tab
    And user choose round trip option
    And user search for <dep_city_name> city and select <dep_airport_name> airport for departure
    And user search for <arr_city_name> city and select <arr_airport_name> airport for arrival
    And user choose future dates for the arrival and departure dates
    And search for the available flights
    Then verify user should see the available flights
    And verify user gets the flights results for the selected dep date

    Examples:
      | <dep_city_name> | <dep_airport_name> | <arr_city_name> | <arr_airport_name> |
      | Columbus        | CMH                | Cleveland       | CLE                |
      | Chicago         | ORD                | Columbus        | CLE                |

  Scenario: verify user is able to search for the avilable flights for a future dates in declarative style
    Given user is on the orbitz homepage
    When search for the available flights for future dates
    Then verify user should see the available flights
    And verify user gets the flights results for the selected dep date



  Scenario: verify user is able to validate the mandatory search fields for flight search
    Given user is on the orbitz homepage
    When user selects the flights tab
    And user choose round trip option
    And user choose future dates for the arrival and departure dates
    And search for the available flights
    Then user should see the "Please select a location" error message

  Scenario: verify user is able to validate all the mandatory search fields for flight search
    Given user is on the orbitz homepage
    When user selects the flights tab
    And user choose round trip option
    And user choose future dates for the arrival and departure dates
    And search for the available flights
    Then user should see the following error messages:
    ||
    ||
    ||


