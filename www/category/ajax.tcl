ad_page_contract {
    This page will display a json object of categories.

    @params     category_id     the id of the category you want to display

    @author         javier.monterroso@nexadevs.com
    @creation-date  2021/06/24
} { category_id }

# create and show the json
#
doc_return 200 application/json [category::export::get_recursive_json_str -category_id $category_id]