
select * from categorias
select * from clientes
select * from compañiasdeenvios
select * from Empleados
select * from Pedidos
select * from productos
select * from proveedores

----------------------------
---Insertar categoria
create procedure USP_InsCategoria
@nombrecategoria varchar(100),
@descripcion text 
as 
begin 
declare @idcategoria INT
SET @idcategoria=(select max(Idcategoria)+1 from categorias)
insert into categorias(idcategoria,nombrecategoria,descripcion)
values (@idcategoria,@nombrecategoria,@descripcion)
end

-----------------------
---Acrtualizar cayegoria
CREATE PROCEDURE USP_UpdCategoria
@idcategoria int,
@nombrecategoria varchar(100),
@descripcion text
as 
begin
UPDATE categorias Set nombrecategoria=@nombrecategoria, descripcion=@descripcion
where idcategoria=@idcategoria
end	

----------------
--Eliminar categoria
CREATE PROCEDURE USP_DelCategoria 
@idcategoria int
as
begin 
delete from categorias where idcategoria=@idcategoria
end

------------------
---Obtener categoria
CREATE PROCEDURE USP_GetCategoria 
@idcategoria int=0
as 
begin 
select Idcategoria,nombrecategoria,descripcion
from categorias
where idcategoria=@idcategoria or @idcategoria=0
end

execute USP_GetCategoria