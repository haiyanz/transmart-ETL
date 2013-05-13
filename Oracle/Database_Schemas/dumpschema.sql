set pagesize 0
set long 90000
set termout off
set feedback off
set echo off
spool schema.sql

-- Get all objects except temporary tables (BIN$...) and "PACKAGE BODY".
SELECT
  dbms_metadata.GET_DDL(u.object_type,u.object_name)
FROM
  user_objects u
WHERE
      object_id IS NOT NULL
  AND object_type not in ('PACKAGE BODY' , 'TYPE BODY','LOB','TABLE SUBPARTITION','TABLE PARTITION','MATERIALIZED VIEW','INDEX SUBPARTITION','INDEX PARTITION')
  AND object_name NOT LIKE 'BIN$%==$0'
ORDER BY
  object_type ASC;


-- Get the "PACKAGE BODY' objects, but feed them to the GET_DDL() function
-- as "PACKAGE".
SELECT
  dbms_metadata.GET_DDL('PACKAGE',u.object_name)
FROM
  user_objects u
WHERE
      object_id IS NOT NULL
  AND object_type = 'PACKAGE BODY';

spool off

