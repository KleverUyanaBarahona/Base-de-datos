declare
codemp number:=4;
aux number;
begin
DBMS_OUTPUT.put_line('Si no existe se insertara');
 select count(*) into aux from rec_empleados where cod_emp = codemp;
if aux=0 then
INSERT INTO rec_empleados VALUES (4,'4ªempleado','01/01/00','jefe',65,4,2000);
if SQL%found then
DBMS_OUTPUT.put_line('El Empleado no existia, se ha insertado con exito '|| SQL%ROWCOUNT|| ' registro');
end if;
else 
if aux>0 then
DBMS_OUTPUT.put_line('El código ingresado ya existe, por lo tanto no puede insertarlo');
end if;
end if;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('ERROR INESPERADO');
end;