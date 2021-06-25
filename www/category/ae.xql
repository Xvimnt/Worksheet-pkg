<?xml version="1.0"?>
<queryset>

    <fullquery name="category_name">
        <querytext>
            select name
            from ctrl_categories
            where category_id = :category_id
        </querytext>
    </fullquery>

    <fullquery name="parent_category_name">
        <querytext>
            select name
            from ctrl_categories
            where category_id = :parent_category_id
        </querytext>
    </fullquery>

</queryset>