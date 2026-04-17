-- Last applied and received logs
SELECT max(sequence#) FROM v$archived_log WHERE applied='YES';
