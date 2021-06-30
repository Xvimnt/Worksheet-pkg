<?xml version="1.0"?>
<queryset>
    <fullquery name="employee::export::get_quota_by_year.select">
        <querytext>
            select *
            from bonification
            where employee_id = :employee_id
            and TO_DATE(to_char(start_date,'YYYY-MM-DD'),'YYYY-MM-DD') < to_timestamp(':year_month', 'MM/YYYY')
            order by start_date desc
            limit 1
        </querytext>
    </fullquery>
    <fullquery name="employee::export::delete_inactive.delete">
        <querytext>
            select employee_delete_inactive ();
        </querytext>
    </fullquery>
    <fullquery name="employee::export::set_uppercase.uppercase">
        <querytext>
            update 
            employee
            set name = upper(name);
        </querytext>
    </fullquery>
</queryset>

