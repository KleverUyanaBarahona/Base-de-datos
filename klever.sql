CREATE OR REPLACE FUNCTION NEMP 
(
  totalempleados IN NUMBER 
) RETURN varchar2 AS 

totalemplados number;
BEGIN
select count(*) into totalempleados from rec_empleados;
DBMS_output.put_line('****************************************');
DBMS_output.put_line('****Total Empleados tratados '|| totalempleados ||' **************');
DBMS_output.put_line('****Total Nómina totalnomina *****************');
DBMS_output.put_line('****************************************');
END NEMP;