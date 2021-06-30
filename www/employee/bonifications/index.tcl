ad_page_contract {
    This page will display the bonfications by date for each employee in the system and modify them.

    @param  employee_id         the id of the employee you wish to add bonifications
    
    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/25

} { "employee_id:integer" }

set user_id [ad_conn user_id]
set ae_url "ae"
set delete_url "delete"
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]

db_multirow -extend { delete_button edit_button} bonification_mr get_bonifications {-employee_id $employee_id} {
    set delete_button "<button type='button' class='btn btn-danger' onclick='delete_item($item_id)' title='Eliminar'><i class='fas fa-trash'></i></button>"
    set edit_button "<button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#dialog\" onclick=\"prompt_request('$ae_url?employee_id=$employee_id&item_id=$item_id')\"  title=\"Editar\"><i class=\"fas fa-check\"></i></button>"
}