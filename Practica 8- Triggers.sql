/**Triggers After of**/

create trigger Trigger_Insertar
on Ciudad
after insert
as
begin
	Select * from inserted
	Select * from deleted
end

/** Prueba**/
insert into Ciudad values (1,'Monterrey')

create Trigger Trigger_Update
on Venta
after update
as
begin
	Select count(iIdPrecio) as VentasTotal from Venta
end

/**Prueba**/
update Venta set iIdPrecio=200 where iIdPasajero=1


/**Trigger Instead**/

create trigger Trigger_Delete
on TPago
instead of delete
as
begin
	Select 'No Eliminar Tipos de Pago'
end

/**Prueba **/
Delete from TPago 