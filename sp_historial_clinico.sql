-- HISTORIAL CLINICO
-- INSERTAR 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertClinicalHistory`(
    IN p_pac_id INT,
    IN p_fecha_creacion DATE,
    IN p_descripcion_general TEXT
)
BEGIN
    INSERT INTO tbl_historialclinico (tbl_pacientes_paci_id, hist_fecha_creacion, hist_descripcion_general)
    VALUES (p_pac_id, p_fecha_creacion, p_descripcion_general);
END $$
DELIMITER ;

-- ACTUALIZAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateClinicalHistory`(
    IN p_historial_id INT,
    IN p_fecha_creacion DATE,
    IN p_descripcion_general TEXT
)
BEGIN
    UPDATE tbl_historialclinico
    SET hist_fecha_creacion = p_fecha_creacion,
        hist_descripcion_general = p_descripcion_general
    WHERE hist_id = p_historial_id;
END $$
DELIMITER ;

-- LEER

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectClinicalHistory`()
BEGIN
    SELECT hist_id, tbl_pacientes_paci_id, hist_fecha_creacion, hist_descripcion_general
    FROM tbl_historialclinico;
END $$
DELIMITER ;


-- ELIMINAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePatient`(
    IN p_paciente_id INT
)
BEGIN
    DELETE FROM tbl_pacientes WHERE paci_id = p_paciente_id;
END $$
DELIMITER ;



