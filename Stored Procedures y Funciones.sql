/**Store Procedure tipo Script**/ 
create procedure Proc_Script as
select e.vNomEmpleado as 'Nombre del Empleado', e.Puesto as 'Puesto',
 v.Fecha as 'Fecha de la venta', v.Hora as Hora from Empleado as e join Venta as v 
 on e.iIdEmpleado = v.iIdEmpleado


 /**Store Procedure de Vistas**/

create procedure Proc_Vista_1 as
Update Vista_1 set iIdAsiento = 1
where iIdViaje =1


create proc Proc_Vista_2 
@nombre varchar(50),
@Puesto int 
as
Select * from Vista_2 where Nombre=@nombre and Puesto=@Puesto


Create proc Proc_Vista_3
@origen int
as
select * from Vista_3 where Origen=@origen


create proc Proc_Vista_4
@nombre varchar(50),
@hora time output
as
set @hora= (select Hora_de_Venta from Vista_4 where Nombre_de_Empleado=@nombre)

create proc Proc_Vista_5
@viaje int
as
Select Costo from Vista_5 
where Viaje=@viaje

/**Funcion**/

create function SituacionViaje(@viaje int)
returns varchar(50)
as
begin
	
	declare @sit int;
	declare @resp varchar(50);

	set @sit= (Select v.tEstadoViaje from Viaje as v where v.iIdViaje=@viaje);

	if(@sit=1)
		begin
			 set @resp='Iniciado';
		end
	else if(@sit=2)
		begin
			 set @resp='En Curso';
		end
	else if(@sit=3)
		begin
			 set @resp='Acabado';
		end

	RETURN @resp

end
go

