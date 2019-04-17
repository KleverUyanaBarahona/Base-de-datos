create table rec_empleados(
Cod_emp number(3) not null,
Nombre varchar2(20) null,
F_ingreso date null,
Puesto varchar(2) null,
Edad number(2) null,
N_hijos Smallint null,
Sueldo_Base number null,
constraint pk_empleados primary key (Cod_emp)
)

create table rec_vehiculos(
Matricula varchar2(7) not null,
Kms_acum number null,
constraint pk_vehiculos primary key (Matricula)
)

create table rec_viaje(
Cod_emp number(3) not null,
Matricula varchar(7) not null,
Mes number null,
Kms number null,
constraint fk_emp1 foreign key (Cod_emp)references rec_empleados(Cod_emp),
constraint fk_matri1 foreign key (Matricula)references rec_vehiculos(Matricula))