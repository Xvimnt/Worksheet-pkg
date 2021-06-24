<?xml version="1.0"?>
<queryset>
   <fullquery name="new_employee">
      <querytext>
        select employee__new (
            :item_id,
            :name,
            :lastname,
            :email,
            ''t'',
            to_date(:due_date, 'YYYY MM DD'),
            NULL,
            NULL,
            :ip_address,
            :context_id,
            :user_id
        );
      </querytext>
   </fullquery>
   <fullquery name="select_employee">
      <querytext>
         select employee.name,
         employee.lastname,
         employee.email,
         to_char(employee.start_date, 'YYYY-MM-DD') as start_date,
         to_char(employee.inactivity_date, 'YYYY-MM-DD') as inactivity_date,
         employee.status
         from employee employee,
         acs_objects obj
         where employee.item_id = :item_id
         and obj.object_id = employee.item_id
         and obj.creation_user = :user_id
         and obj.context_id = :package_id
      </querytext>
   </fullquery>
   <fullquery name="update_employee">
      <querytext>
         update employee
         set name= :name,
         lastname = :lastname,
         email = :email,
         status = :status,
         start_date = to_date(:start_date, 'YYYY MM DD'),
         inactivity_date = to_date(:inactivity_date, 'YYYY MM DD')
         where item_id = :item_id
      </querytext>
   </fullquery>
</queryset>