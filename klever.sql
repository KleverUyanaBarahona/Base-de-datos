CREATE TABLE Rec_empleados(
Cod_emp NUMBER(3) NOT NULL,
Nombre VARCHAR2(2)null,
F_ingreso date null,
Puesto varchar(2) null,
Edad number(2) null,
N_hijos SMALLINT null,
Sueldo_Base number null,
constraint pk_empleados PRIMARY key (Cod_emp)
)