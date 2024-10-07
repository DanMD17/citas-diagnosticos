use odontodb;
-- insertar un usuario
DELIMITER //
CREATE PROCEDURE spInsertUser(
    IN correo VARCHAR(80),
    IN contrasena TEXT,
    IN estado VARCHAR(15),
    IN fecha_creacion DATE,
    IN empleado_emp_id INT,
    IN roles_rol_id INT
)
BEGIN
    INSERT INTO tbl_usuarios (
        usu_correo, 
        usu_contrasena, 
        usu_estado, 
        usu_fecha_creacion, 
        tbl_empleado_emp_id, 
        tbl_roles_rol_id
    ) 
    VALUES (
        correo, 
        contrasena, 
        estado, 
        fecha_creacion, 
        empleado_emp_id, 
        roles_rol_id
    );
END //
DELIMITER ;

-- actualizar un usuario
DELIMITER //
CREATE PROCEDURE spUpdateUser(
    IN usuario_id INT,
    IN correo VARCHAR(80),
    IN contrasena TEXT,
    IN estado VARCHAR(15),
    IN empleado_emp_id INT,
    IN roles_rol_id INT
)
BEGIN
    UPDATE tbl_usuarios
    SET 
        usu_correo = correo,
        usu_contrasena = contrasena,
        usu_estado = estado,
        tbl_empleado_emp_id = empleado_emp_id,
        tbl_roles_rol_id = roles_rol_id
    WHERE usu_id = usuario_id;
END //
DELIMITER ;

-- obtener informacion de un usuario 

DELIMITER //
CREATE PROCEDURE spSelectUser(
    IN usuario_id INT
)
BEGIN
    SELECT 
        usu_id, 
        usu_correo, 
        usu_estado, 
        usu_fecha_creacion,
        tbl_empleado_emp_id, 
        tbl_roles_rol_id
    FROM tbl_usuarios
    WHERE usu_id = usuario_id;
END //
DELIMITER ;


-- eliminar un usuario 

DELIMITER //
CREATE PROCEDURE spDeleteUser(
    IN usuario_id INT
)
BEGIN
    DELETE FROM tbl_usuarios
    WHERE usu_id = usuario_id;
END //
DELIMITER ;




