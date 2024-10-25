-- Insertar un nuevo usuario
DELIMITER //
CREATE PROCEDURE spInsertUser(
    IN p_usu_correo VARCHAR(80),
    IN p_usu_contrasena TEXT,
    IN p_usu_estado VARCHAR(15),
    IN p_usu_fecha_creacion DATE,
    IN p_usu_empleado_emp_id INT,
    IN p_usu_roles_rol_id INT
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
        p_usu_correo, 
        p_usu_contrasena, 
        p_usu_estado, 
        p_usu_fecha_creacion, 
        p_usu_empleado_emp_id, 
        p_usu_roles_rol_id
    );
END //
DELIMITER ;

-- Actualizar un usuario
DELIMITER //
CREATE PROCEDURE spUpdateUser(
    IN p_usu_id INT,
    IN p_usu_correo VARCHAR(80),
    IN p_usu_contrasena TEXT,
    IN p_usu_estado VARCHAR(15),
    IN p_usu_fecha_creacion DATE,
    IN p_usu_empleado_emp_id INT,
    IN p_usu_roles_rol_id INT
)
BEGIN
    UPDATE tbl_usuarios
    SET 
        usu_correo = p_usu_correo,
        usu_contrasena = p_usu_contrasena,
        usu_estado = p_usu_estado,
        usu_fecha_creacion = p_usu_fecha_creacion,
        tbl_empleado_emp_id = p_usu_empleado_emp_id,
        tbl_roles_rol_id = p_usu_roles_rol_id
    WHERE usu_id = p_usu_id;
END //
DELIMITER ;

-- Listar todos los usuarios
DELIMITER //
CREATE PROCEDURE spSelectUsers()
BEGIN
    SELECT 
        usu_id, 
        usu_correo, 
        usu_estado, 
        usu_fecha_creacion,
        tbl_empleado_emp_id, 
        tbl_roles_rol_id
    FROM tbl_usuarios;
END //
DELIMITER ;


-- Eliminar un usuario
DELIMITER //
CREATE PROCEDURE spDeleteUser(
    IN p_usu_id INT
)
BEGIN
    DELETE FROM tbl_usuarios
    WHERE usu_id = p_usu_id;
END //
DELIMITER ;
