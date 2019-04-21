--------------------------------------------------------
-- Archivo creado  - domingo-abril-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REC_VIAJES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REC_VIAJES" 
   (	"COD_EMP_1" NUMBER(3,0), 
	"MATRICULA" VARCHAR2(7 BYTE), 
	"MES" NUMBER, 
	"KMS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REC_VEHICULOS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REC_VEHICULOS" 
   (	"MATRICULA" VARCHAR2(7 BYTE), 
	"KMS_ACUM" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REC_EMPLEADOS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REC_EMPLEADOS" 
   (	"COD_EMP" NUMBER(3,0), 
	"NOMBRE" VARCHAR2(20 BYTE), 
	"F_INGRESO" DATE, 
	"PUESTO" VARCHAR2(20 BYTE), 
	"EDAD" NUMBER(2,0), 
	"N_HIJOS" NUMBER(*,0), 
	"SUELDO_BASE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.REC_VIAJES
SET DEFINE OFF;
Insert into SYSTEM.REC_VIAJES (COD_EMP_1,MATRICULA,MES,KMS) values ('1','2586png','5','3000');
Insert into SYSTEM.REC_VIAJES (COD_EMP_1,MATRICULA,MES,KMS) values ('2','7884tbc','5','2000');
Insert into SYSTEM.REC_VIAJES (COD_EMP_1,MATRICULA,MES,KMS) values ('3','5113ycb','5','1000');
REM INSERTING into SYSTEM.REC_VEHICULOS
SET DEFINE OFF;
Insert into SYSTEM.REC_VEHICULOS (MATRICULA,KMS_ACUM) values ('2586png','10000');
Insert into SYSTEM.REC_VEHICULOS (MATRICULA,KMS_ACUM) values ('5113ycb','105000');
Insert into SYSTEM.REC_VEHICULOS (MATRICULA,KMS_ACUM) values ('7884tbc','50000');
REM INSERTING into SYSTEM.REC_EMPLEADOS
SET DEFINE OFF;
Insert into SYSTEM.REC_EMPLEADOS (COD_EMP,NOMBRE,F_INGRESO,PUESTO,EDAD,N_HIJOS,SUELDO_BASE) values ('1','1ªempleado',to_date('10/10/10','DD/MM/RR'),'conductor','28','0','1000');
Insert into SYSTEM.REC_EMPLEADOS (COD_EMP,NOMBRE,F_INGRESO,PUESTO,EDAD,N_HIJOS,SUELDO_BASE) values ('2','2ªempleado',to_date('01/01/11','DD/MM/RR'),'conductor','45','2','1100');
Insert into SYSTEM.REC_EMPLEADOS (COD_EMP,NOMBRE,F_INGRESO,PUESTO,EDAD,N_HIJOS,SUELDO_BASE) values ('3','3ªempleado',to_date('20/02/05','DD/MM/RR'),'director','53','3','1300');
--------------------------------------------------------
--  DDL for Index PK_VEHICULOS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_VEHICULOS" ON "SYSTEM"."REC_VEHICULOS" ("MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_EMPLEADOS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_EMPLEADOS" ON "SYSTEM"."REC_EMPLEADOS" ("COD_EMP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
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
--------------------------------------------------------
--  DDL for Procedure COMPROBARMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."COMPROBARMES" 
(
  ME IN number 
) AS 
error_mes exception;
begin
if me<1 or me>12 then
raise error_mes;
ELSE
DBMS_OUTPUT.put_line('MES CORRECTO,TU MES ES '||me);
END IF;
EXCEPTION
WHEN ERROR_MES THEN
DBMS_OUTPUT.put_line('ERROR EN EL MES, TIENE QUE ESTAR ENTRE EL 1-12');
END COMPROBARMES;

/
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
--------------------------------------------------------
--  DDL for Function SUELDO_BASE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."SUELDO_BASE" 
(
  CODEMP IN number 
) RETURN NUMBER AS 
sueldobase rec_empleados.sueldo_base%type;
sueldo number;
BEGIN
select sueldo_base into sueldobase from rec_empleados where cod_emp=codemp;
sueldo:=sueldobase;
 RETURN sueldo;
 END sueldo_base ;

/
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
--------------------------------------------------------
--  Constraints for Table REC_VIAJES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REC_VIAJES" MODIFY ("COD_EMP_1" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REC_VIAJES" MODIFY ("MATRICULA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REC_VEHICULOS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REC_VEHICULOS" MODIFY ("MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REC_VEHICULOS" ADD CONSTRAINT "PK_VEHICULOS" PRIMARY KEY ("MATRICULA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REC_EMPLEADOS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REC_EMPLEADOS" MODIFY ("COD_EMP" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REC_EMPLEADOS" ADD CONSTRAINT "PK_EMPLEADOS" PRIMARY KEY ("COD_EMP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REC_VIAJES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REC_VIAJES" ADD CONSTRAINT "FK_EMP1" FOREIGN KEY ("COD_EMP_1")
	  REFERENCES "SYSTEM"."REC_EMPLEADOS" ("COD_EMP") ENABLE;
  ALTER TABLE "SYSTEM"."REC_VIAJES" ADD CONSTRAINT "FK_MATRI1" FOREIGN KEY ("MATRICULA")
	  REFERENCES "SYSTEM"."REC_VEHICULOS" ("MATRICULA") ENABLE;
