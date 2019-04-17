create table rec_viajes(
Cod_emp number(3) not null,
Matricula varchar(7) not null,
Mes number null,
Kms number null,
constraint fk_emp1 foreign key (Cod_emp)references rec_empleados(Cod_emp),
constraint fk_matri1 foreign key (Matricula) references rec_vehiculos(Matricula))