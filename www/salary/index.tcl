ad_page_contract {
    This page will display the ordinary salary by date.

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/23
} { }

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set category_id 3101

# Url for ctrl-category
#
set ae_url "../category/ae?parent_category_id=$category_id"
set delete_url "../category/delete";
set data_url "../category/ajax?category_id=$category_id"