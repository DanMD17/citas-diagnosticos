-- Insertar un nuevo tratamiento realizado
DELIMITER $$
CREATE PROCEDURE spInsertTratamientoRealizado(
    IN p_trata_nombre VARCHAR(45), 
    IN p_trata_descripcion VARCHAR(200), 
    IN p_trata_fecha DATE, 
    IN p_trata_observaciones TEXT, 
    IN p_cita_id INT
)
BEGIN
    INSERT INTO tbl_tratamientos_realizados (trata_nombre, trata_descripcion, trata_fecha, trata_observaciones, tbl_citas_cita_id)
    VALUES (p_trata_nombre, p_trata_descripcion, p_trata_fecha, p_trata_observaciones, p_cita_id);
END $$
DELIMITER ;

-- Leer todos los tratamientos realizados
DELIMITER $$
CREATE PROCEDURE spSelectTratamientoRealizado()
BEGIN
    SELECT * FROM tbl_tratamientos_realizados;
END $$
DELIMITER ;

-- Actualizar un tratamiento realizado
DELIMITER $$
CREATE PROCEDURE spUpdateTratamientoRealizado(
    IN p_trata_id INT, 
    IN p_trata_nombre VARCHAR(45), 
    IN p_trata_descripcion VARCHAR(200), 
    IN p_trata_fecha DATE, 
    IN p_trata_observaciones TEXT
)
BEGIN
    UPDATE tbl_tratamientos_realizados 
    SET trata_nombre = p_trata_nombre, trata_descripcion = p_trata_descripcion, trata_fecha = p_trata_fecha, 
    trata_observaciones = p_trata_observaciones
    WHERE trata_id = p_trata_id;
END $$
DELIMITER ;

-- Eliminar un tratamiento realizado
DELIMITER $$
CREATE PROCEDURE spDeleteTratamientoRealizado(IN p_trata_id INT)
BEGIN
    DELETE FROM tbl_tratamientos_realizados WHERE trata_id = p_trata_id;
END $$
DELIMITER ;
