#/packages/ctrl-categories/tcl/category-export-procs.tcl
ad_library {
    Set of TCL procedures to handle category json str

    @author javier.monterroso@nexadevs.com
    @creation-date 2021-24-06
}

namespace eval category::export {}

ad_proc -public category::export::get_json_str {
    -category_id:required 
} {
    Return the category json str
    @option category_id the ctrl_categories table category_id
} {
    db_0or1row select "" -column_array category_row
    set category_json_str "\"name\":\"$category_row(name)\""
    if {$category_row(plural) ne ""} {
        append category_json_str ", \"plural\":\"$category_row(plural)\""
    }
    if {$category_row(description) ne ""} {
        append category_json_str ", \"description\":\"$category_row(description)\""
    }
    if {$category_row(category_id) ne ""} {
        append category_json_str ", \"category_id\":\"$category_row(category_id)\""
    }
    append category_json_str ", \"enabled_p\":\"$category_row(enabled_p)\""

    if {$category_row(profiling_weight) ne ""} {
        append category_json_str ", \"profiling_weight\":\"$category_row(profiling_weight)\""
    }
    if {$category_row(alt_code) ne ""} {
        append category_json_str ", \"alt_code\":\"$category_row(alt_code)\""
    }
    if {$category_row(activity_category) ne ""} {
        append category_json_str ", \"activity_category\":\"$category_row(activity_category)\""
    }
    return $category_json_str
}   

ad_proc -public category::export::get_recursive_json_str {
    -category_id:required
} {
    Return the category whole json string with chidren
    @option category_id the ctrl_categories table category_id
} {
    set category_json_str "\{"
    append category_json_str [category::export::get_json_str -category_id $category_id]
    set sub_category_id_list [db_list sub_category_id_list ""]
    if {[llength $sub_category_id_list] > 0 } {
        append category_json_str ", \"children\":\["
        set child_num 0
        foreach sub_category_id $sub_category_id_list {
            if { $child_num > 0 } {
                append category_json_str ", "
            } 
            append category_json_str [category::export::get_recursive_json_str -category_id $sub_category_id]
            incr child_num
        }
        append category_json_str "\]"
    } 
    append category_json_str "\}" 
    return $category_json_str
}
