# Delete inactive users
#
ad_schedule_proc -thread t -once t 20  employee::export::delete_inactive

# Set names to uppercase
#
ad_schedule_proc -thread t -once t 20  employee::export::set_uppercase
