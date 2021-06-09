module UtilitiesModule
  def change_correct_date_format no_of_days
    (Time.now + 24 * 60 * 60 * no_of_days).strftime ("%b %-d, %Y")
  end

  def display_date_format_in_the_search_results no_of_days
    (Time.new +24 * 60 * 60 * no_of_days).strftime("%a %b, %d")
  end

  def display_date_format_in_search_results no_of_days

    (Time.new +24 * 60 * 60 * no_of_days).strftime("%a %b, %d")
  end

  def validate_error_message err_msg
    found = false
    @browser.h5s(class: 'alert-message').each do |each_error_msg|
      if each_error_message.text.include? err_msg
        found = true
        return found

      end
      return found
    end
  end

  def verify_both_results_are_same? actual_results, expected_results
    if actual_results == expected_results
      p "Both results are correct"
    end
    fail "Expected - #{expected_results} is NOT same as Actual - #{actual_results}"
  end

  def verify_partial_text_exists? full_text, partial_text
    if full_text.include? partial_text
      p "#{partial_text} exists in #{full_text}"
    else
      fail "partial text - #{partial_text} does NOT exists in - #{full_text}"
    end

  end

end