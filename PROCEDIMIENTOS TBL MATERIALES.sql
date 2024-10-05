use odontodb;

-- insertar material
DELIMITER //
CREATE PROCEDURE spInsertMaterial(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_cantidad INT,
    IN p_trata_id INT  
)
BEGIN
    INSERT INTO tbl_materiales (
        mate_nombre, 
        mate_descripcion, 
        mate_cantidad, 
        tbl_tratamientos_realizados_trata_id  
    ) 
    VALUES (
        p_nombre, 
        p_descripcion, 
        p_cantidad, 
        p_trata_id  
    );
END //
DELIMITER ;

-- actualizar material

DELIMITER //
CREATE PROCEDURE spUpdateMaterial(
    IN p_mate_id INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_cantidad INT,
    IN p_trata_id INT  -- Llave foránea
)
BEGIN
    UPDATE tbl_materiales
    SET 
        mate_nombre = p_nombre,
        mate_descripcion = p_descripcion,
        mate_cantidad = p_cantidad,
        tbl_tratamientos_realizados_trata_id = p_trata_id  -- Llave foránea
    WHERE mate_id = p_mate_id;
END //
DELIMITER ;

-- obtener un material especifico

DELIMITER //
CREATE PROCEDURE spSelectMaterial(
    IN p_mate_id INT
)
BEGIN
    SELECT 
        mate_id, 
        mate_nombre, 
        mate_descripcion, 
        mate_cantidad, 
        tbl_tratamientos_realizados_trata_id  
    FROM tbl_materiales
    WHERE mate_id = p_mate_id;
END //
DELIMITER ;

-- listar materiales 

DELIMITER //
CREATE PROCEDURE spListMaterials()
BEGIN
    SELECT 
        mate_id, 
        mate_nombre, 
        mate_descripcion, 
        mate_cantidad, 
        tbl_tratamientos_realizados_trata_id 
    FROM tbl_materiales;
END //
DELIMITER ;

-- eliminar material

DELIMITER //
CREATE PROCEDURE spDeleteMaterial(
    IN p_mate_id INT
)
BEGIN
    DELETE FROM tbl_materiales
    WHERE mate_id = p_mate_id;
END //
DELIMITER ;



