create database MiVestido


	
	
	create table Vestidos
	(
		Imagen varchar(max) not null,
		Id_Vest varchar(20) not null primary key,
		Descr_Vest varchar(max) not null,
		Talla_Vest varchar (max) not null,
	)

	create table Accesorios
	(
	   Imagen_Acc varchar(max) not null,
	   Id_Acc varchar(20) not null primary key,
	   Descripcion_Acc varchar(max) not null
	)
	create table Bolsas
	(
	   Imagen_Bolsa varchar(max) not null,
	   Id_Bolsa varchar(20) not null primary key,
	   Descripcion_Bolsa varchar(max) not null
	)
	create table Zapatos
	(
	   Imagen_Zap varchar(max) not null,
	   Id_Zap varchar(20) not null primary key,
	   Descripcion_Zap varchar(max) not null
	)
	create table Clientes
	(
		Id_Cl smallint primary key,
		Nom_Cl varchar (max) not null,
		Dir_Cl varchar (max) not null,
		Cd_Cl varchar (max) not null,
		Tel_Cl varchar (max) not null,
		Cel_Cl varchar (max) not null
	)
	create table Empleados
	(
		
		Id_Emp smallint primary key,
		Nom_Emp varchar (max) not null,
		PagoH_Emp decimal (8,2) not null,
		Tel_Emp varchar (max) not null
	)

	create table Asistencia
	(
		Semana varchar(10) not null,
		Id_Emp smallint foreign key references Empleados(Id_Emp),
		Horas integer not null
	)


	create table TipoCargoExtra
	(
		Id_Cargo varchar(10) not null primary key,
		Descripcion varchar(50) not null,
	    Costo integer not null

	)

	create table Anticipos
	(
		Fecha_Rent varchar(max) not null,
		Id_Rent smallint PRIMARY KEY not null,
		Id_Cl smallint foreign key references Clientes (Id_Cl),
		Id_Vest varchar(20) foreign key references Vestidos(Id_Vest),
		Id_Acc varchar(20) foreign key references Accesorios (Id_Acc),
		Id_Bolsa varchar(20) foreign key references Bolsas (Id_Bolsa),
		Id_Zap varchar(20) foreign key references Zapatos(Id_Zap),
		Id_Emp smallint foreign key references Empleados (Id_Emp),
		Tot_Rent integer not null,
		CargosExtras varchar(10) not null foreign key references TipoCargoExtra(Id_Cargo),
		Anticipo integer not null,
		Semana varchar(10) not null
	)
	
  
	create table Factura
	(
		
		Id_Orden smallint PRIMARY KEY not null,	
		Id_Renta smallint foreign key references Anticipos(Id_Rent),	
		Semana varchar(10) not null,
		Total integer not null
	)

	



  SELECT DISTINCT Talla_Vest
FROM Vestidos


select * from Anticipos where Semana='46'


select top 10 C.Nom_Cl , COUNT(A.Id_Cl)as NumeroDeRentas from Clientes as C, Anticipos as A where C.Id_Cl=A.Id_Cl group by C.Nom_Cl


select sum(a.Anticipo) as TotalAnticipo, sum(f.total) as TotalLiquidaciones
from Anticipos as A, Factura as F
where a.semana='46'and f.semana='46'
group by a.semana, f.semana