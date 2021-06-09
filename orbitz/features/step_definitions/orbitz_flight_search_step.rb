Given(/^user is on the orbitz homepage$/) do
  visit OrbitHomePage
end
When(/^user selects the flights tab$/) do
  on(OrbitHomePage).select_flight_tab_element.click
end

And(/^user choose round trip option$/) do
  on(OrbitHomePage).choose_round_trip_element.click
end

And(/^user search for (.+) city and select (.+) airport for departure$/) do |city_name, air_code|
  on(OrbitHomePage).verify_leaving_from city_name, air_code
end

And(/^user search for (.+) city and select (.+) airport for arrival$/) do |city_name, air_code|
  on(OrbitHomePage).verify_going_to city_name, air_code
end

And(/^user choose future dates for the arrival and departure dates$/) do
  on(OrbitHomePage).choose_dep_date 1
  on(OrbitHomePage).choose_arr_date 3

end

And(/^search for the available flights$/) do
  on(OrbitHomePage).submit_button_element.click
end

Then(/^verify user should see the available flights$/) do
  fail " NO results are found" unless on(OrbitzFlightSearchPage).get_flight_results_count > 1
end

And(/^verify user gets the flights results for the selected dep date$/) do
  exp_date = on(OrbitzFlightSearchPage).display_date_format_in_the_search_results 1
  actual_date = on(OrbitzFlightSearchPage).flight_results_title_element.text
  verify_both_results_are_same? exp_date, actual_date

end

Then(/^user should see the "([^"]*)" error message$/) do |error_message|
  all_error = on(OrbitHomePage).get_all_error_message
  fail "Error Message - #{error_message} is not found in the list of error - #{all_errors}" unless all_errors.include? error_message
end