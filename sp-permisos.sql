--Insertar Permiso

DELIMITER //
CREATE PROCEDURE spInsertPermission(
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(80)
)
BEGIN
    INSERT INTO tbl_permisos (per_nombre, per_descripcion) 
    VALUES (p_nombre, p_descripcion);
END//
DELIMITER ;

--Actualizar Permiso

DELIMITER //
CREATE PROCEDURE spUpdatePermission(
    IN p_id INT,
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(80)
)
BEGIN
    UPDATE tbl_permisos 
    SET per_nombre = p_nombre, per_descripcion = p_descripcion
    WHERE per_id = p_id;
END//
DELIMITER ;

--Eliminar Permiso

DELIMITER //
CREATE PROCEDURE spDeletePermission(
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_permisos 
    WHERE per_id = p_id;
END//
DELIMITER ;

--Mostrar Permisos

DELIMITER //
CREATE PROCEDURE spSelectPermission()
BEGIN
    SELECT * 
    FROM tbl_permisos;
END//
DELIMITER ;

--DDL Permiso

DELIMITER //
CREATE PROCEDURE spSelectPermissionDDL()
BEGIN
    SELECT per_id, per_nombre
    FROM tbl_permisos;
END//
DELIMITER ;
