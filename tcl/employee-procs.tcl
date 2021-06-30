ad_library {
    Set of TCL procedures to handle employees in the project

    @author javier.monterroso@nexadevs.com
    @creation-date 2021-28-06
}

namespace eval employee::export {}

ad_proc -public employee::export::get_quota_by_year {
    -year_month:required
    -employee_id:required
    -type:required
} {
    Return the last bonification per employee
    @option year_month the bonification table start_date
    @option employee_id the bonification table employee_id
    @option parent_typeid the ctrl_categories table type
} {
    db_0or1row select "" -column_array category_row
    return $category_row(plural)
}


ad_proc -public employee::export::delete_inactive { } {
    Delete inactive users in our system
} {
    ctrl_batch_log::new -batch_name "delete inactives employees" -status "start" -message "Process Start."
    db_exec_plsql delete {}
    ctrl_batch_log::new -batch_name "delete inactives employees" -status "finish" -message "Process Finished."
}


ad_proc -public employee::export::set_uppercase { } {
    set to uppercase all the names of the employees
} {
    ctrl_batch_log::new -batch_name "update to uppercase employees names" -status "start" -message "Process Start."
    db_dml uppercase {}
    ctrl_batch_log::new -batch_name "update to uppercase employees names" -status "finish" -message "Process Finished."
}

ad_proc -public employee::export::send_notification {
    -employee_name:required
    -employee_email:required
} {
    Send an email to the employee making him aware that is already in our system
    @option employee_name the name of the employee that we put in the body
    @option employee_email the email where we want to send the notification
} {
    set var_list [list subscriber_name "$employee_name" subscriber_email "$employee_email"]
    ns_log Notice "worksheet NOTIF *creation* -data_p: 1 -var_list $var_list New Employee"
}