--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function COMPLEMENTO_HIJOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."COMPLEMENTO_HIJOS" 
(
  CODEMP IN VARCHAR2 
) RETURN NUMBER AS 
complemento_hijos number;
hijos rec_empleados.n_hijos%type;
sueldo rec_empleados.sueldo_base%type;
BEGIN
select n_hijos into hijos from rec_empleados where cod_emp=codemp;
select (sueldo_base*0.05) into sueldo from rec_empleados where cod_emp=codemp;
complemento_hijos:=hijos*sueldo;
  RETURN complemento_hijos;
END COMPLEMENTO_HIJOS;

/
