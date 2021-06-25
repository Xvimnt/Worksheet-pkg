create table bonification (
    item_id integer,
    employee_id integer,
    type char(1),
    amount integer,
    start_date date default now(),
    constraint bonification_pk primary key (item_id),
    constraint bonification_fk foreign key (item_id) references acs_objects(object_id),
    constraint bonification_employee_fk foreign key (employee_id) references employee(item_id)
);

create function inline_0 ()
returns integer as '
    begin
    PERFORM acs_object_type__create_type (
        ''bonification_item'',
        ''Bonification Item'',
        ''Bonification Items'',
        ''acs_object'',
        ''bonification_item'',
        ''item_id'',
        ''bonification'',
        ''f'',
        null,
        null
    );
    return 0;
end;' language 'plpgsql';

select inline_0 ();

drop function inline_0 ();

\i packages/worksheet/sql/postgresql/worksheet-package.sql