ad_page_contract {
    This page will display the iggs fee by date.

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/23
} { }

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set category_id 3099

# Url for ctrl-category
#
set salary_url "/ctrl-categories/add-edit?parent_category_id=$category_id";
set salary_delete_url "/ctrl-categories/delete";
set data_url "../json/category-ajax?category_id=$category_id"
