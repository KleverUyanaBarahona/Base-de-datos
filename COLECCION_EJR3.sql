DECLARE
cursor c_codemp is
select* from rec_empleados ;
emp c_codemp%rowtype;
e  emp.cod_emp%type;
tn rec_empleados.sueldo_base%type;
cont rec_empleados.sueldo_base%type;
error_mes exception;
BEGIN
DBMS_OUTPUT.put_line('COD_EMP|NOMBRE    |F_INGRESO|PUESTO     |EDAD|N_HIJOS|SUELDO_BASE');
open c_codemp;
FETCH c_codemp into emp;
while c_codemp%FOUND loop
e:=emp.cod_emp;
DBMS_OUTPUT.put_line(' '||EMP.COD_EMP||'     '||EMP.NOMBRE||' '||EMP.F_INGRESO||'   '||EMP.PUESTO||'     '||EMP.EDAD||'     '||EMP.N_HIJOS||'     '||EMP.SUELDO_BASE);
FETCH c_codemp into emp;
  end loop;
 EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('ERROR INESPERADO');
END;