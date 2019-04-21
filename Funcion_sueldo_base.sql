--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function SUELDO_BASE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."SUELDO_BASE" 
(
  CODEMP IN number 
) RETURN NUMBER AS 
sueldobase rec_empleados.sueldo_base%type;
sueldo number;
BEGIN
select sueldo_base into sueldobase from rec_empleados where cod_emp=codemp;
sueldo:=sueldobase;
 RETURN sueldo;
 END sueldo_base ;

/
