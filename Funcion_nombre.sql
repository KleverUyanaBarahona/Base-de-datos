--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function NOMBRE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."NOMBRE" 
(
  CODEMP IN VARCHAR2 
) RETURN VARCHAR2 AS 
nombre_emp rec_empleados.nombre%type;
BEGIN
 select nombre into nombre_emp from rec_empleados where cod_emp=codemp;
RETURN nombre_emp;
END NOMBRE;

/
