ad_page_contract {
    This page will display the ordinary salary by date.

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/23
} {
    orderby:optional
}

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set salary_url "/ctrl-categories/add-edit?category_id=3101";

# Salary Fees by year
#
template::list::create -name salary_list \
-multirow salary_list_mr \
-elements {
    title {
        label "Salary"
        link_url_col item_url
        link_html {title "Click to view this item details" }
    }
    due_date_pretty {
        label "Due Date"
    }
    status_text {
        label "Status"
    }
    creation_date_pretty {
        label "Creation Date"
    }
} -orderby {
    title { orderby todo.title }
    due_date_pretty {orderby todo.due_date}
    status_text {orderby todo.status}
    creation_date_pretty {orderby obj.creation_date}
} -actions {
    "Add New Task" "todo-ae" "Click here to add a new item to the list"
}

# Order by sql
#
if {[exists_and_not_null orderby]} {
    set orderby_clause "ORDER BY [template::list::orderby_clause -name iggs_list]"
} else {
    set orderby_clause "ORDER BY due_date asc"
}

# Get IGGS Fees 
#    
# db_multirow -extend { delete_button } todo_list_mr get_tasks {} {
#     set form_mode display
#     set delete_button "<button type='button' class='btn btn-danger' onclick='delete_item($item_id)'>Delete</button>"
# }