-- SQL Profile check
SELECT sql_id, sql_profile FROM v$sql WHERE sql_id='&sql_id';
