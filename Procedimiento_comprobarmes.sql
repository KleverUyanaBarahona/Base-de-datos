--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure COMPROBARMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."COMPROBARMES" 
(
  ME IN number 
) AS 
error_mes exception;
begin
if me<1 or me>12 then
raise error_mes;
ELSE
DBMS_OUTPUT.put_line('MES CORRECTO,TU MES ES '||me);
END IF;
EXCEPTION
WHEN ERROR_MES THEN
DBMS_OUTPUT.put_line('ERROR EN EL MES, TIENE QUE ESTAR ENTRE EL 1-12');
END COMPROBARMES;

/
