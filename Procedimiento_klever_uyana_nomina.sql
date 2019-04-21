--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure KLEVER_UYANA_NOMINA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."KLEVER_UYANA_NOMINA" 
(
  ME IN VARCHAR2 
) AS
m number:=5;
cursor c_codemp is
select cod_emp from rec_empleados inner join rec_viajes on rec_empleados.cod_emp=rec_viajes.cod_emp_1 where mes=me;
emp c_codemp%rowtype;
e  emp.cod_emp%type;
tn rec_empleados.sueldo_base%type;
cont rec_empleados.sueldo_base%type;
error_mes exception;
BEGIN
comprobarmes(me);
cont:=0;
open c_codemp;
FETCH c_codemp into emp;
while c_codemp%FOUND loop
e:=emp.cod_emp;
tn:=total_nomina(e);
cont:=cont+tn;
FETCH c_codemp into emp;
  end loop;
DBMS_OUTPUT.put_line('**********************************************');
DBMS_OUTPUT.put_line('**** Total Empleados tratados '|| total_empleados(me) ||' **************');
DBMS_OUTPUT.put_line('**** Total Nóminas ' ||cont||' **********************');
DBMS_OUTPUT.put_line('**********************************************');
  close c_codemp;
  open c_codemp;
FETCH c_codemp into emp;
while c_codemp%FOUND loop
e:=emp.cod_emp;
DBMS_OUTPUT.put_line('Nómina del mes '||me);
DBMS_OUTPUT.put_line('Nombre del empleado ....... '||nombre(e));
DBMS_OUTPUT.put_line('Sueldo Base ............... '||sueldo_base(e));
DBMS_OUTPUT.put_line('Complemento KM............. '||complemento_km(e));
DBMS_OUTPUT.put_line('Complemento Hijos ......... '||complemento_hijos(e));
DBMS_OUTPUT.put_line('Total Nómina .............. '||total_nomina(e));
DBMS_OUTPUT.put_line('**********************************************');
FETCH c_codemp into emp;
  end loop;
  close c_codemp;
  EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('ERROR EN LA APLICACION');
      ROLLBACK;
      RAISE;
END KLEVER_UYANA_NOMINA;

/
