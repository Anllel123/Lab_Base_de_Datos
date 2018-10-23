/** Modifique esta practica ya que no funcionaba en la base anterior, solo funciona en la nueva**/

USE Senda

/**3 sub consultas**/
SELECT * FROM Chofer
SELECT * FROM Autobus
SELECT * FROM Boleto
SELECT * FROM Caja
select * from Cliente

SELECT * FROM TPago 
WHERE  iIdTPago =(
	SELECT iIdVenta
	FROM Venta
	WHERE iIdPasajero = 1 
)

SELECT * 
FROM 
(SELECT vTipoP, (
				SELECT COUNT(iIdPasajero)
				from Pasajero as p
				where p.iIdPasajero > 10
				)as 'NumDePasajeros'
from TipoPasajero) as TipoDe
where TipoDe.NumDePasajeros > 0



select  (
		select count (iIdBoleto) as NumBoletos
		from Boleto
		)as BoletosTotales
from Boleto




SELECT * 
FROM 
(SELECT iIdAutobus, (
				SELECT COUNT(iIdChoferAutobus)
				from ChoferAutobus as ch
				where ch.iIdAutobus = ch.iIdAutobus
				)as 'CantidadDeChofers'
from Autobus) as Au
where au.CantidadDeChofers > 0

/** Vistas**/

create view Vista_1 as
select b.iIdViaje, a.iIdAsiento from Boleto as b inner join Asiento as a on b.iIdAsiento=a.iIdAsiento

create view Vista_2 as
select e.vNomEmpleado +' '+ e.vApePatEm +' '+ e.vApeMatEm Nombre,e.tEdadEmpleado as Edad, p.iIdPuesto as Puesto  
from Empleado as e inner join Puesto as p on e.Puesto=1

create view Vista_3 as
select ev.vEstadoViaje as Estado, r.iIdOrigen as Origen
from EstadoViaje as ev left join Ruta as r
on ev.vEstadoViaje = 'Iniciado'
where r.iIdRuta>1  
group by ev.vEstadoViaje,r.iIdOrigen

create view Vista_4 as 
select e.vNomEmpleado as Nombre_de_Empleado, v.Hora as Hora_de_Venta, tp.vTipoP as Tipo_de_Pago  from Empleado as e  join Venta as v  
on e.iIdEmpleado=1 
join TPago as tp 
on V.iIdTPago = TP.iIdTPago 

create view Vista_5 as
select b.iIdViaje as Viaje, p.mCosto as Costo from Boleto as b left join Precio as p 
on b.iIdPrecio=p.iIdPrecio
where p.mCosto>100
group by b.iIdViaje,p.mCosto


/** Consulta dinamica**/

declare @query nvarchar (MAX)
set @query =  'select * from Asiento'
exec (@query)

declare @query nvarchar (MAX)
declare @nomcolm nvarchar (MAX)= 'iIdChoferAutobus'
set @query =  'Select '+  @nomcolm +' from ChoferAutobus'
exec (@query)