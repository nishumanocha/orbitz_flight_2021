choose_arr_date 'Jun 16, 2021'
exp_date = 'Thu, Jun 10'

def change_correct_date_format no_of_days
  (Time.now+60*60*24 +no_of_days).strftime("%b %d, %Y")
end

def displayed_date_format_in_the_search_results no_of_days

  (Time.now+60*60*24 +no_of_days).strftime("%a %d, %Y")
end
p change_correct_date_format 3
p displayed_date_format_in_the_search_results 3