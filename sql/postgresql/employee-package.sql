CREATE OR REPLACE FUNCTION employee__new (integer,varchar,varchar,varchar,char,date,date,bytea,varchar,integer,integer)
RETURNS integer AS '
    DECLARE
        p_item_id ALIAS FOR $1;
        p_name ALIAS FOR $2; -- default null
        p_lastname ALIAS FOR $3; -- default null
        p_email ALIAS FOR $4; -- default null
        p_status ALIAS FOR $5; -- default null
        p_start_date ALIAS FOR $6;
        p_inactivity_date ALIAS FOR $7; -- default null
        p_photo ALIAS FOR $8; -- default null
        p_creation_ip ALIAS FOR $9; -- default null
        p_context_id ALIAS FOR $10; -- default null
        p_creation_user ALIAS FOR $11; -- default null
        
        v_id integer;
        v_type varchar;

    BEGIN
        v_type := ''employee_item'';
     
        v_id := acs_object__new(
            p_item_id,
            v_type,
            now(),
            p_creation_user,
            p_creation_ip,
            p_context_id::Integer,
            true
        );

        insert into employee
            (item_id, name, lastname, email, status, start_date, inactivity_date, photo)
        values
            (p_item_id, p_name, p_lastname, p_email, p_status, p_start_date, p_inactivity_date, p_photo);

        return v_id;
    END;
' LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION employee_delete (integer)
RETURNS VOID AS '
    DECLARE
        p_item_id ALIAS FOR $1; 
    BEGIN 
        delete from employee where item_id = p_item_id;
        PERFORM acs_object__delete(p_item_id);
    END;
' LANGUAGE 'plpgsql';