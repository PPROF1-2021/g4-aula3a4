-- Registrar un nuevo usuario a la base de datos.--
INSERT INTO Usuarios (usuario, contraseña, correo_electronico, idCliente, idEstado) 
values ('admin', '1234', 'admin@findmyteam.com', '1', '1');

-- Consultar si existe el usuario “Juan” en la base de datos y si la contraseña “123456” es correcta. ---
SELECT usuario, contraseña 
from Usuarios 
WHERE usuario LIKE 'juan' AND contraseña LIKE '123456';

-- Insertar un registro en nuestra entidad principal---
INSERT INTO Clientes ( nombre, apellido, fecha_nacimiento, telefono, ciudad, idUbicacion_cliente,  idEstado, idGenero) 
values ('Maria', 'Lopez', '15/05/1989', '351478925', 'cordoba', '1', '1', '1');

--  Actualizar un dato en nuestra entidad principal para un registro específico.--
UPDATE Usuarios SET contraseña= '987654321' WHERE idUsuario = 1;

-- Actualizar un dato en nuestra entidad principal para un grupo de registros.--
UPDATE Clientes SET nombre = 'Juan' , apellido = 'Perez', telefono ='123456789' WHERE idCliente = 1;

-- Eliminar un registro específico de la base de datos--
DELETE FROM Clientes WHERE idCliente = 1; 