<?xml version="1.0"?>
<queryset>
   <fullquery name="get_bonifications">
      <querytext>
        select 
         bonification.item_id,
         bonification.employee_id,
         bonification.amount,
         bonification.type,
         to_char(bonification.start_date, 'DD/MM/YYYY') as date
         from bonification bonification,
         employee employee,
         acs_objects obj
         where obj.object_id = bonification.item_id
         and employee.item_id = :employee_id
         and bonification.employee_id = employee.item_id
         and obj.creation_user = :user_id
         and obj.context_id = :package_id
      </querytext>
   </fullquery>
</queryset>