create table employee (
    item_id integer,
    name varchar(500),
    lastname varchar(500),
    email varchar(500),
    status char(1),
    start_date date default now(),
    inactivity_date date,
    photo bytea,
    constraint employee_pk primary key (item_id),
    constraint employee_fk foreign key (item_id) references acs_objects(object_id)
);

create function inline_0 ()
returns integer as '
    begin
    PERFORM acs_object_type__create_type (
        ''employee_item'',
        ''Employee Item'',
        ''Employee Items'',
        ''acs_object'',
        ''employee_item'',
        ''item_id'',
        ''employee'',
        ''f'',
        null,
        null
    );
    return 0;
end;' language 'plpgsql';

select inline_0 ();

drop function inline_0 ();

\i packages/worksheet/sql/postgresql/worksheet-package.sql