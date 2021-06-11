class OrbitHomePage
  require_relative '../module/Utilities_module'
  include PageObject
  include UtilitiesModule
  page_url "www.orbitz.com"

  #@browser.link(class: 'uitk-tab-anchor', index: 1).click
  link(:select_flight_tab, class: 'uitk-tab-anchor', index: 1)
  link(:select_car_tab, class: 'uitk-tab-anchor', index: 2)

  #@browser.link(text: "Roundtrip")
  span(:choose_round_trip, class: 'uitk-tab-text', index: 6)
  button(:choose_from, aria_label: 'Leaving from')
  text_field(:leaving_from, id: 'location-field-leg1-origin')
  button(:choose_going, aria_label: 'Going to')
  text_field(:going_to, id: 'location-field-leg1-destination')
  ul(:all_dep_airports, data_stid: 'location-field-legal-origin-results')
  ul(:all_arr_airports, data_stid: 'location-field-legal-destination-results')
  #date picker fields
  button(:choose_dep_date_btn1, id: 'd1-btn')
  button(:date_done_button, data_stid: 'apply-date-picker')
  button(:choose_arr_date_btn1, id: 'd1-btn')

  button(:submit_button, data_testid: 'submit-button')
  divs(:error_messages, class: 'uitk-error-message')

  def get_all_error_message
    error_messages_elements.map(&:text)
    # all_error = []
    # error_messages_elements.each do |each_error|
    #   all_error << each_error.text
    # end
    # all_error
  end

  def verify_leaving_from city_name, air_code
    choose_from_element.click
     self.leaving_from = city_name, air_code
    #leaving_from_element.set  city_name, air_code
    all_dep_airports_element.list_item_element.each do |each_airport|
      p each_airport.text
      if each_airport.text.include? air_code
        each_airport.click
        break
      end

    end

  end

  def verify_going_to city_name, air_code
    choose_going_element.click
    self.going_to = city_name, air_code
    all_arr_airport_element.list_item_elements.each do |each_airport|
      p each_airport
      if each_airport.text include? air_code
        each_airport.click
        break
      end
    end
  end

  def choose_dep_date no_of_days
    dep_date = change_correct_date_format no_of_days
    choose_dep_date_btn1_element.click
    sleep 5

    @browser.button(aria_label: dep_date).click
    date_done_button
  end

  def choose_arr_date no_of_days
    arr_date = change_correct_date_format no_of_days
    choose_dep_date_btn1_element.click
    @browser.button(aria_label: arr_date).click
    date_done_button
  end

  def search
    @browser.button(date_testid: 'submit-button').click

  end
end
