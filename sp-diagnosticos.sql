-- Insertar un nuevo diagnóstico
DELIMITER //
CREATE PROCEDURE spInsertDiagnosis(
    IN p_cita_id INT, 
    IN p_diag_descripcion TEXT,
    IN p_diag_fecha DATE,
    IN p_diag_observaciones TEXT,
    IN p_historial_id INT
)
BEGIN
    INSERT INTO tbl_diagnosticos (
        tbl_citas_cita_id, 
        diag_descripcion, 
        diag_fecha, 
        diag_observaciones, 
        tbl_historialclinico_hist_id
    )
    VALUES (
        p_cita_id, 
        p_diag_descripcion, 
        p_diag_fecha, 
        p_diag_observaciones, 
        p_historial_id
    );
END//
DELIMITER ;

-- Actualizar un diagnóstico
DELIMITER //
CREATE PROCEDURE spUpdateDiagnosis(
    IN p_diag_id INT,
    IN p_cita_id INT,
    IN p_diag_descripcion TEXT,
    IN p_diag_fecha DATE,
    IN p_diag_observaciones TEXT,
    IN p_historial_id INT
)
BEGIN
    UPDATE tbl_diagnosticos
    SET tbl_citas_cita_id = p_cita_id,
        diag_descripcion = p_diag_descripcion,
        diag_fecha = p_diag_fecha,
        diag_observaciones = p_diag_observaciones,
        tbl_historialclinico_hist_id = p_historial_id
    WHERE diag_id = p_diag_id;
END//
DELIMITER ;

-- Leer todos los diagnósticos
DELIMITER //
CREATE PROCEDURE spSelectDiagnosis()
BEGIN
    SELECT diag_id, tbl_citas_cita_id, diag_descripcion, diag_fecha, diag_observaciones, tbl_historialclinico_hist_id
    FROM tbl_diagnosticos;
END//
DELIMITER ;

-- Eliminar un diagnóstico
DELIMITER //
CREATE PROCEDURE spDeleteDiagnosis(
    IN p_diag_id INT
)
BEGIN
    DELETE FROM tbl_diagnosticos
    WHERE diag_id = p_diag_id;
END//
DELIMITER ;