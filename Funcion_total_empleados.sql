--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function TOTAL_EMPLEADOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."TOTAL_EMPLEADOS" (
  ME IN number 
) RETURN NUMBER
AS TOTAL_EMPLEADOS rec_empleados.sueldo_base%type;

BEGIN
SELECT COUNT(COD_EMP) INTO TOTAL_EMPLEADOS from rec_empleados inner join rec_viajes on rec_empleados.cod_emp=rec_viajes.cod_emp_1 where mes=me;
  RETURN TOTAL_EMPLEADOS;
END TOTAL_EMPLEADOS;

/
