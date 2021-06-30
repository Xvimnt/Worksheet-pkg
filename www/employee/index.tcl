ad_page_contract {
    This page will display the employees in the system and modify them.

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/23
} { }

set user_id [ad_conn user_id]
set ae_url "ae"
set status_url "status"
set bonifications_url "bonifications"
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]

db_multirow -extend { item_url return_url delete_button edit_button adds_button} employee_mr get_employees {} {
    set form_mode display
    # set status_text [todo::get_status_label $status ]
    set item_url "ae?[export_vars -url { item_id form_mode }]"
    set return_url [util_get_current_url]
    set adds_button "<a type=\"button\" class=\"btn btn-info\" data-bs-toggle=\"modal\" data-bs-target=\"#dialog\" href=\"$bonifications_url?employee_id=$item_id\"  title=\"Editar\"><i class=\"fas fa-file-invoice-dollar\"></i></a>"
    if { $status eq "t" } {
        set delete_button "<button type='button' class='btn btn-danger' onclick='change_status($item_id,\"f\")' title='Cambiar Status'><i class='fas fa-sync'></i></button>"
    } else {
        set delete_button "<button type='button' class='btn btn-success' onclick='change_status($item_id,\"t\")' title='Cambiar Status'><i class='fas fa-sync'></i></button>"
    }
    set edit_button "<button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#dialog\" onclick=\"prompt_request('$ae_url?item_id=$item_id')\"  title=\"Editar\"><i class=\"fas fa-check\"></i></button>"
}