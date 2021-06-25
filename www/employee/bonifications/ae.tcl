# To know if the user have permissions over this item
#
if { [exists_and_not_null item_id] && [acs_object::object_p -id $item_id]} {
    if { [ string equal $form_mode "edit" ] } {
        permission::require_permission -object_id $item_id -privilege write
    } else {
        permission::require_permission -object_id $item_id -privilege read
    }
}

ad_page_contract {
    This page allows the users to add new items to their bonifications list or edit existing items.

    @param  item_id         the id of the bonification you wish to edit
    @param  employee_id     the id of the employee you wish to manage

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/25
} {
    item_id:optional
    employee_id:integer
    { form_mode "edit" }
    {return_url [get_referrer]}
}

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set ip_address [ad_conn peeraddr]
set context_id [ad_conn package_id] 

ad_form -name bonification_form -export { user_id package_id employee_id } -mode $form_mode -form {
    item_id:key
    { type:text(select) 
        {label "type"} 
        {
            options {
                {"Bonificacion" "b"}
                {"ISR" "i"}
            }
        } 
    }
    { amount:text {label "amount"} }
    { start_date:text {label "Date: "} {format {DD/MM/YYYY} } }
} -select_query_name select_bonification \
-new_data {
    set context_id [ad_conn package_id]
    db_exec_plsql new_bonification { -employee_id $employee_id }

    # setting permission of the new object to the current user
    permission::grant -party_id $user_id \
    -object_id $item_id \
    -privilege "general_comments_create"
    
} -edit_data {
    # update the information on our table
    db_dml update_bonification {}
    # update the last modified information on the object
    db_exec_plsql to_do_list_obj_item_object_update {
        select acs_object__update_last_modified(:item_id,:user_id,:ip_address)
    }
} -after_submit {
    template::forward $return_url
}