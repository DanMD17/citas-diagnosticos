-- Insertar un nuevo tratamiento realizado
DELIMITER //
CREATE PROCEDURE spInsertTreatmentPerformed(
    IN p_trata_nombre VARCHAR(45), 
    IN p_trata_descripcion VARCHAR(200), 
    IN p_trata_fecha DATE, 
    IN p_trata_observaciones TEXT,
    IN p_trata_cita_id INT,
    IN p_trata_hist_id INT,
    IN p_trata_aux_id INT
)
BEGIN
    INSERT INTO tbl_tratamientos_realizados (
        trata_nombre, 
        trata_descripcion, 
        trata_fecha, 
        trata_observaciones, 
        tbl_citas_cita_id, 
        tbl_historialclinico_hist_id, 
        tbl_auxiliares_aux_id
    )
    VALUES (
        p_trata_nombre, 
        p_trata_descripcion, 
        p_trata_fecha, 
        p_trata_observaciones, 
        p_trata_cita_id, 
        p_trata_hist_id, 
        p_trata_aux_id
    );
END//
DELIMITER ;

-- Leer todos los tratamientos realizados
DELIMITER //
CREATE PROCEDURE spSelectTreatmentsPerformed()
BEGIN
    SELECT 
        trata_id, trata_nombre, trata_descripcion, trata_fecha, trata_observaciones,
        tbl_citas_cita_id, tbl_citas.cita_estado,
        tbl_historialclinico_hist_id, tbl_historialclinico.hist_descripcion_general,
        tbl_auxiliares_aux_id, tbl_auxiliares.aux_funcion
        FROM tbl_tratamientos_realizados 
        INNER JOIN tbl_citas 
        ON tbl_tratamientos_realizados.tbl_citas_cita_id = tbl_citas.cita_id
        INNER JOIN tbl_historialclinico 
        ON tbl_tratamientos_realizados.tbl_historialclinico_hist_id = tbl_historialclinico.hist_id
        INNER JOIN tbl_auxiliares 
        ON tbl_tratamientos_realizados.tbl_auxiliares_aux_id = tbl_auxiliares.aux_id;
end//
DELIMITER ;

-- Actualizar un tratamiento realizado
DELIMITER //
CREATE PROCEDURE spUpdateTreatmentPerformed(
    IN p_trata_id INT, 
    IN p_trata_nombre VARCHAR(45), 
    IN p_trata_descripcion VARCHAR(200), 
    IN p_trata_fecha DATE, 
    IN p_trata_observaciones TEXT,
    IN p_trata_cita_id INT,
    IN p_trata_hist_id INT,
    IN p_trata_aux_id INT
)
BEGIN
    UPDATE tbl_tratamientos_realizados 
    SET trata_nombre = p_trata_nombre, 
        trata_descripcion = p_trata_descripcion, 
        trata_fecha = p_trata_fecha, 
        trata_observaciones = p_trata_observaciones,
        tbl_citas_cita_id = p_trata_cita_id,
        tbl_historialclinico_hist_id = p_trata_hist_id,
        tbl_auxiliares_aux_id = p_trata_aux_id
    WHERE trata_id = p_trata_id;
END//
DELIMITER ;

-- Eliminar un tratamiento realizado
DELIMITER //
CREATE PROCEDURE spDeleteTreatmentPerformed(IN p_trata_id INT)
BEGIN
    DELETE FROM tbl_tratamientos_realizados WHERE trata_id = p_trata_id;
END//
DELIMITER ;

-- Drop Down List
DELIMITER //
CREATE PROCEDURE spSelectTreatmentsDDL()
BEGIN
    SELECT trata_id, trata_nombre
    FROM tbl_tratamientos_realizados;
END//
DELIMITER ;

