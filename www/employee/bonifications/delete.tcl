ad_page_contract {
	This page will delete an item from the bonfication list package and then return the user
	to the specified return URL.

	@param  item_id			the id of the bonfication you wish to delete

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/25
} {
	item_id
}

permission::require_permission -object_id $item_id -privilege delete
set user_id [ad_conn user_id]

db_dml delete_bonification {}