declare
codemp number:=4;
aux number;
begin
DBMS_OUTPUT.put_line('Si no existe no se podra borrar');
 select count(*) into aux from rec_empleados where cod_emp = codemp;
if aux=0 then

DBMS_OUTPUT.put_line('no existe el Empleado');
else 
if aux>0 then
delete from rec_empleados where cod_emp=codemp;
if SQL%found then
DBMS_OUTPUT.put_line('El Empleado ingresado ya existe, y se a borrado con exito '||SQL%ROWCOUNT|| ' registro');
end if;
end if;
end if;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('ERROR INESPERADO');
end;