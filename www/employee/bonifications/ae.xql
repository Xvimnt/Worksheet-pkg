<?xml version="1.0"?>
<queryset>
   <fullquery name="new_bonification">
      <querytext>
        select bonification__new (
            :item_id,
            :employee_id,
            :type,
            :amount,
            to_date(:start_date, 'DD/MM/YYYY'),
            :ip_address,
            :context_id,
            :user_id
        );
      </querytext>
   </fullquery>
   <fullquery name="select_bonification">
      <querytext>
         select
            bonification.item_id,
            bonification.employee_id,
            bonification.amount,
            bonification.type,
            to_char(bonification.start_date, 'DD/MM/YYYY') as start_date
            from bonification bonification,
            employee employee,
            acs_objects obj
            where bonification.item_id = :item_id
            and obj.object_id = bonification.item_id
            and bonification.employee_id = employee.item_id
            and obj.creation_user = :user_id
            and obj.context_id = :package_id
      </querytext>
   </fullquery>
   <fullquery name="update_bonification">
      <querytext>
         update bonification
            set type= :type,
            amount = :amount,
            start_date = to_date(:start_date, 'DD/MM/YYYY')
            where item_id = :item_id
      </querytext>
   </fullquery>
</queryset>