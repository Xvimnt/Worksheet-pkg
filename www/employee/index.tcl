ad_page_contract {
    This page will display the employees in the system and modify them.

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/23
} { }

set user_id [ad_conn user_id]
set form_url "ae"
set delete_url "delete"
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]

template::list::create -name employee_list \
    -multirow employee_list_mr \
    -elements {
        title {
            label "Employee"
            link_url_col item_url
            link_html {title "Click to view this item details" }
        }
        start_date {
            label "Start Date"
        }
        status_text {
            label "Status"
        }
        creation_date_pretty {
            label "Creation Date"
        }
        view {
            display_template "View"
            link_url_col item_url
        }
    } -orderby {
        name {orderby employee.name}
        lastname {orderby employee.lastname}
        start_date {orderby employee.start_date}
    } -actions {
        "Add New Employee" "ae" "Click here to add a new item to the list"
    }
    if {[exists_and_not_null orderby]} {
        set orderby_clause "ORDER BY [template::list::orderby_clause -name todo_list]"
    } else {
        set orderby_clause "ORDER BY start_date asc"
    }

db_multirow -extend { item_url return_url delete_button complete_button cancel_button} employee_mr get_employees {} {
    set form_mode display
    set item_url "todo-ae?[export_vars -url { item_id form_mode }]"
    # set status_text [todo::get_status_label $status ]
    set return_url [util_get_current_url]
    set delete_button "<button type='button' class='btn btn-danger' onclick='delete_item($item_id)'>Delete</button>"
    set complete_button "<button type='button' class='btn btn-success' onclick='complete_item($item_id)'>Complete</button>"
    set cancel_button "<button type='button' class='btn btn-warning' onclick='cancel_item($item_id)'>Cancel</button>"
}