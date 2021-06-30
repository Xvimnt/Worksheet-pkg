<?xml version="1.0"?>
<queryset>
    <fullquery name="category::export::get_quota_by_year.select">
        <querytext>
            select *
            from ctrl_categories
            where parent_category_id = :parent_id
            and name < :year
            order by name desc
            limit 1
        </querytext>
    </fullquery>
    <fullquery name="category::export::get_json_str.select">
        <querytext>
            select *
            from ctrl_categories
            where category_id = :category_id
        </querytext>
    </fullquery>
    <fullquery name="category::export::get_recursive_json_str.sub_category_id_list">
        <querytext>
            select category_id
            from ctrl_categories
            where parent_category_id = :category_id
        </querytext>
    </fullquery>
</queryset>

