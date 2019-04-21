--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function TOTAL_NOMINA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."TOTAL_NOMINA" 
(
  CODEMP IN number 
) RETURN NUMBER AS
TOTALNOMINA NUMBER;
sueldobase rec_empleados.sueldo_base%type;
sueldo number;
kilometros rec_viajes.kms%type;
puesto rec_empleados.puesto%type;
complemento_hijos number;
hijos rec_empleados.n_hijos%type;
sueldo_b rec_empleados.sueldo_base%type;
BEGIN
select sueldo_base into sueldobase from rec_empleados where cod_emp=codemp;
sueldo:=sueldobase;
select puesto into puesto from rec_empleados WHERE cod_emp=codemp;
if puesto='conductor' then
select (kms*0.03) into kilometros from rec_viajes where cod_emp_1=codemp;
else
kilometros:=0;
end if;
  select n_hijos into hijos from rec_empleados where cod_emp=codemp;
complemento_hijos:=hijos*(sueldo*0.03);
totalnomina:=sueldo+kilometros+complemento_hijos;
  RETURN totalnomina;
END TOTAL_NOMINA;

/
