create table cliente
(dni	number(8),
nombre	varchar(15) not null,
apellido varchar(15) not null,
ciudad	varchar(15),
primary key (dni));

insert into cliente values (1,'LUIS','GARCIA','MADRID');
insert into cliente values (2,'ANTONIO','LOPEZ','VALENCIA');
insert into cliente values (3,'JUAN','MARTIN','MADRID');
insert into cliente values (4,'MARIA','GARCIA','MADRID');
insert into cliente values (5,'JAVIER','GONZALEZ','BARCELONA');
insert into cliente values (6,'ANA','LOPEZ','BARCELONA');

create table auto
(codauto number(8),
nombre	varchar(15) not null, 
modelo	varchar(15) not null,
primary key (codauto));

insert into auto values (1,'IBIZA','GLX');
insert into auto values (2,'IBIZA','GTI');
insert into auto values (3,'IBIZA','GTD');
insert into auto values (4,'TOLEDO','GTD');
insert into auto values (5,'CORDOBA','GTI');
insert into auto values (6,'MEGANE','1.6');
insert into auto values (7,'MEGANE','GTI');
insert into auto values (8,'LAGUNA','GTD');
insert into auto values (9,'LAGUNA','TD');
insert into auto values (10,'ZX','16V');
insert into auto values (11,'ZX','TD');
insert into auto values (12,'XANTIA','GTD');
insert into auto values (13,'A4','1.8');
insert into auto values (14,'A4','2.8');
insert into auto values (15,'ASTRA','CARAVAN');
insert into auto values (16,'ASTRA','GTI');
insert into auto values (17,'CORSA','1.4');
insert into auto values (18,'300','316.i');
insert into auto values (19,'500','525i');
insert into auto values (20,'700','750i');

create table concesionario
(RUC	number(8),
nombre	varchar(15) not null,
ciudad	varchar(15) not null,
primary key (RUC));

insert into concesionario values (1,'ACAR','MADRID');
insert into concesionario values (2,'BCAR','MADRID');
insert into concesionario values (3,'CCAR','BARCELONA');
insert into concesionario values (4,'DCAR','VALENCIA');
insert into concesionario values (5,'ECAR','BILBAO');

create table distribucion
(RUC	number(8),
codauto number(8),
cantidad number(3),
primary key (RUC, codauto),
foreign key (RUC) references concesionario,
foreign key (codauto) references auto);

insert into distribucion values (1,1,3);
insert into distribucion values (1,5,7);
insert into distribucion values (1,6,7);
insert into distribucion values (2,6,5);
insert into distribucion values (2,8,10);
insert into distribucion values (2,9,10);
insert into distribucion values (3,10,5);
insert into distribucion values (3,11,3);
insert into distribucion values (3,12,5);
insert into distribucion values (4,13,10);
insert into distribucion values (4,14,5);
insert into distribucion values (5,15,10);
insert into distribucion values (5,16,20);
insert into distribucion values (5,17,8);
insert into distribucion values (4,19,3);
insert into distribucion values (4,6,null);

create table marca
(codmarca number(8),
nombre varchar(15) not null,
ciudad varchar(15),
primary key (codmarca));

insert into marca values (1,'SEAT','MADRID');
insert into marca values (2,'RENAULT','BARCELONA');
insert into marca values (3,'CITROEN','VALENCIA');
insert into marca values (4,'AUDI','MADRID');
insert into marca values (5,'OPEL','BILBAO');
insert into marca values (6,'BMW','BARCELONA');

create table asignacion 
(codmarca number(8),
codauto number(8),
primary key (codmarca, codauto),
foreign key (codmarca) references marca,
foreign key (codauto) references auto);

insert into asignacion values (1,1);
insert into asignacion values (1,2);
insert into asignacion values (1,3);
insert into asignacion values (1,4);
insert into asignacion values (1,5);
insert into asignacion values (2,6);
insert into asignacion values (2,7);
insert into asignacion values (2,8);
insert into asignacion values (2,9);
insert into asignacion values (3,10);
insert into asignacion values (3,11);
insert into asignacion values (3,12);
insert into asignacion values (4,13);
insert into asignacion values (4,14);
insert into asignacion values (5,15);
insert into asignacion values (5,16);
insert into asignacion values (5,17);
insert into asignacion values (6,18);
insert into asignacion values (6,19);
insert into asignacion values (6,20);

create table venta
(nroventa number(8),
RUC	number(8),
dni	number(8),
codauto	number(8),
color   varchar(15),
precio  number(7,2),
primary key (nroventa),
foreign key (RUC, codauto) references distribucion,
foreign key (dni) references cliente);

insert into venta values (1,1,1,1,'BLANCO',32000);
insert into venta values (2,1,2,5,'ROJO',18000);
insert into venta values (3,2,1,6,'ROJO',28000);
insert into venta values (4,2,3,8,'BLANCO',24000);
insert into venta values (5,3,4,11,'ROJO',48000);
insert into venta values (6,4,5,14,'VERDE',35000);
insert into venta values (7,1,2,5,'ROJO',18000);
insert into venta values (8,2,1,6,'ROJO',28000);