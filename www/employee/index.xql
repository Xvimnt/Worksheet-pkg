<?xml version="1.0"?>
<queryset>
   <fullquery name="get_employees">
      <querytext>
        select 
         employee.item_id,
         employee.name,
         employee.lastname,
         employee.email,
         to_char(employee.start_date, 'DD/MM/YYYY') as start_date,
         to_char(employee.inactivity_date, 'DD/MM/YYYY') as inactivity_date,
         employee.status
         from employee employee,
         acs_objects obj
         where obj.object_id = employee.item_id
         and obj.creation_user = :user_id
         and obj.context_id = :package_id
        $orderby_clause
      </querytext>
   </fullquery>
</queryset>