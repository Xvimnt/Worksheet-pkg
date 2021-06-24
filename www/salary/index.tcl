ad_page_contract {
    This page will display the ordinary salary by date.

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/23
} { }

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set category_id 3101

# Update the json
#
set category_json_str [ctrl_category::export::get_recursive_json_str -category_id $category_id]
set json_file_name  category_$category_id.json
set json_file_dir [acs_root_dir]
append json_file_dir "/packages/ctrl-categories/www/resources/"
set fh [open $json_file_dir$json_file_name "w"]
puts -nonewline $fh $category_json_str
close $fh

# Url for ctrl-category
#
set salary_url "/ctrl-categories/add-edit?parent_category_id=$category_id";
set salary_delete_url "/ctrl-categories/delete";
set data_url "/ctrl-categories/resources/category_$category_id.json"

