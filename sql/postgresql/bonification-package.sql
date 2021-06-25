CREATE OR REPLACE FUNCTION bonification__new (integer,integer,char,integer,date,varchar,integer,integer)
RETURNS integer AS '
    DECLARE
        p_item_id ALIAS FOR $1;
        p_employee ALIAS FOR $2; -- default null
        p_type ALIAS FOR $3; -- default null
        p_amount ALIAS FOR $4; -- default null
        p_start_date ALIAS FOR $5; -- default null
        p_creation_ip ALIAS FOR $6; -- default null
        p_context_id ALIAS FOR $7; -- default null
        p_creation_user ALIAS FOR $8; -- default null
        
        v_id integer;
        v_type varchar;

    BEGIN
        v_type := ''bonification_item'';
     
        v_id := acs_object__new(
            p_item_id,
            v_type,
            now(),
            p_creation_user,
            p_creation_ip,
            p_context_id::Integer,
            true
        );

        insert into bonification
            (item_id, employee_id, type, amount, start_date)
        values
            (p_item_id, p_employee, p_type, p_amount, p_start_date);

        return v_id;
    END;
' LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION bonification_delete (integer)
RETURNS VOID AS '
    DECLARE
        p_item_id ALIAS FOR $1; 
    BEGIN 
        delete from bonification where item_id = p_item_id;
        PERFORM acs_object__delete(p_item_id);
    END;
' LANGUAGE 'plpgsql';