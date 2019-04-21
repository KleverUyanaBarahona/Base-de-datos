--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function COMPLEMENTO_KM
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."COMPLEMENTO_KM" 
(
  CODEMP IN VARCHAR2 
) RETURN NUMBER AS 
complemento_KM number;
kilometros rec_viajes.kms%type;
puesto rec_empleados.puesto%type;
BEGIN
select puesto into puesto from rec_empleados WHERE cod_emp=codemp;
if puesto='conductor' then
select (kms*0.03) into kilometros from rec_viajes where cod_emp_1=codemp;
complemento_km:=kilometros;
else
kilometros:=0;
RETURN kilometros;
end if;
  RETURN kilometros;
END COMPLEMENTO_KM;

/
