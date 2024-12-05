-- HISTORIAL CLÍNICO
-- Insertar un nuevo historial clínico
DELIMITER //
CREATE PROCEDURE spInsertClinicalHistory(
    IN p_hist_pac_id INT, -- ID del paciente (llave foránea)
    IN p_hist_odo_id INT, -- ID del odontologo (llave foránea)
    IN p_hist_fecha_creacion DATE, -- Fecha de creación del historial
    IN p_hist_descripcion_general TEXT -- Descripción general del historial
)
BEGIN
    INSERT INTO tbl_historialclinico (
        tbl_pacientes_paci_id, 
        tbl_odontologos_odo_id,
        hist_fecha_creacion, 
        hist_descripcion_general
    )
    VALUES (
        p_hist_pac_id,
        p_hist_odo_id,
        p_hist_fecha_creacion, 
        p_hist_descripcion_general
    );
END//
DELIMITER ;

-- Actualizar un historial clínico
DELIMITER //
CREATE PROCEDURE spUpdateClinicalHistory(
    IN p_hist_id INT, -- ID del historial clínico
    IN p_hist_fecha_creacion DATE, -- Fecha de creación del historial
    IN p_hist_descripcion_general TEXT, -- Descripción general del historial
    IN p_hist_pac_id INT, -- ID del paciente (llave foránea)
    IN p_hist_odo_id INT
)
BEGIN
    UPDATE tbl_historialclinico
    SET hist_fecha_creacion = p_hist_fecha_creacion,
        hist_descripcion_general = p_hist_descripcion_general,
        tbl_pacientes_paci_id = p_hist_pac_id,
        tbl_odontologos_odo_id = p_hist_odo_id
    WHERE hist_id = p_hist_id;
END//
DELIMITER ;

-- Leer todos los historiales clínicos
DELIMITER //
CREATE PROCEDURE spSelectClinicalHistories()
BEGIN
    SELECT 
        hist_id, 
        hist_fecha_creacion, 
        hist_descripcion_general,
        tbl_pacientes_paci_id, 
        tbl_pacientes.paci_nombre,
        tbl_odontologos.odo_id AS tbl_odontologos_odo_id,
        tbl_empleados.emp_nombre AS odontologo_nombre
    FROM tbl_historialclinico
    INNER JOIN tbl_pacientes
        ON tbl_historialclinico.tbl_pacientes_paci_id = tbl_pacientes.paci_id
    INNER JOIN tbl_odontologos
        ON tbl_historialclinico.tbl_odontologos_odo_id = tbl_odontologos.odo_id
    INNER JOIN tbl_empleados
        ON tbl_odontologos.tbl_empleados_emp_id = tbl_empleados.emp_id;
END//
DELIMITER ;


-- Eliminar un historial clínico
DELIMITER //
CREATE PROCEDURE spDeleteClinicalHistory(
    IN p_hist_id INT -- ID del historial clínico
)
BEGIN
    DELETE FROM tbl_historialclinico 
    WHERE hist_id = p_hist_id;
END//
DELIMITER ;

-- Drop Down List
DELIMITER //
CREATE PROCEDURE spSelectClinicalHistoriesDDL()
BEGIN
    SELECT 
        h.hist_id, 
        CONCAT(p.paci_nombre, ' ', p.paci_apellido, ' - ', DATE_FORMAT(h.hist_fecha_creacion, '%Y-%m-%d')) AS hist_info
    FROM 
        tbl_historialclinico h
    INNER JOIN 
        tbl_pacientes p 
    ON 
        h.tbl_pacientes_paci_id = p.paci_id;
END//
DELIMITER ;

