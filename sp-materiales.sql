-- Insertar un nuevo material
DELIMITER //
CREATE PROCEDURE spInsertMaterial(
    IN p_mate_nombre VARCHAR(100),
    IN p_mate_descripcion TEXT,
    IN p_mate_cantidad INT,
    IN p_trata_id INT  -- Llave foránea
)
BEGIN
    INSERT INTO tbl_materiales (
        mate_nombre, 
        mate_descripcion, 
        mate_cantidad, 
        tbl_tratamientos_realizados_trata_id  
    ) 
    VALUES (
        p_mate_nombre, 
        p_mate_descripcion, 
        p_mate_cantidad, 
        p_trata_id  
    );
END//
DELIMITER ;

-- Actualizar un material
DELIMITER //
CREATE PROCEDURE spUpdateMaterials(
    IN p_mate_id INT,
    IN p_mate_nombre VARCHAR(100),
    IN p_mate_descripcion TEXT,
    IN p_mate_cantidad INT,
    IN p_trata_id INT  -- Llave foránea
)
BEGIN
    UPDATE tbl_materiales
    SET 
        mate_nombre = p_mate_nombre,
        mate_descripcion = p_mate_descripcion,
        mate_cantidad = p_mate_cantidad,
        tbl_tratamientos_realizados_trata_id = p_trata_id  -- Llave foránea
    WHERE mate_id = p_mate_id;
END//
DELIMITER ;

-- Listar materiales

DELIMITER //
CREATE PROCEDURE spSelectMaterial()
BEGIN
    SELECT 
        mate_id, 
        mate_nombre, 
        mate_descripcion, 
        mate_cantidad, 
        tbl_tratamientos_realizados_trata_id, 
        tbl_tratamientos_realizados.trata_nombre, 
        DATE_FORMAT(tbl_tratamientos_realizados.trata_fecha, '%Y-%m-%d') AS trata_fecha,
        tbl_pacientes.paci_nombre AS paciente_nombre
    FROM 
        tbl_materiales
    INNER JOIN 
        tbl_tratamientos_realizados
        ON tbl_materiales.tbl_tratamientos_realizados_trata_id = tbl_tratamientos_realizados.trata_id
    INNER JOIN 
        tbl_citas
        ON tbl_tratamientos_realizados.tbl_citas_cita_id = tbl_citas.cita_id
    INNER JOIN 
        tbl_pacientes
        ON tbl_citas.tbl_pacientes_paci_id = tbl_pacientes.paci_id;
END//
DELIMITER ;


-- Eliminar un material
DELIMITER //
CREATE PROCEDURE spDeleteMaterial(
    IN p_mate_id INT
)
BEGIN
    DELETE FROM tbl_materiales
    WHERE mate_id = p_mate_id;
END//
DELIMITER ;

-- Cuenta cuántos materiales existen

DELIMITER //
CREATE PROCEDURE spSelectCountMaterials(OUT total_materiales INT)
BEGIN
    SELECT COUNT(mate_id) INTO total_materiales
    FROM tbl_materiales;
END//
DELIMITER ;