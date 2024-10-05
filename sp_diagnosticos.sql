-- DIAGNOSTICO
-- INSERTAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertDiagnosis`(
    IN p_cita_id INT, -- ID de la cita (llave foránea)
    IN p_diag_descripcion TEXT,
    IN p_diag_fecha DATE,
    IN p_diag_observaciones TEXT
)
BEGIN
    INSERT INTO tbl_diagnosticos (tbl_citas_cita_id, diag_descripcion, diag_fecha, diag_observaciones)
    VALUES (p_cita_id, p_diag_descripcion, p_diag_fecha, p_diag_observaciones);
END $$
DELIMITER ;

-- ACTUALIZAR

CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateDiagnosis`(
    IN p_diag_id INT,
    IN p_cita_id INT,
    IN p_diag_descripcion TEXT,
    IN p_diag_fecha DATE,
    IN p_diag_observaciones TEXT
)
BEGIN
    UPDATE tbl_diagnosticos
    SET tbl_citas_cita_id = p_cita_id,
        diag_descripcion = p_diag_descripcion,
		diag_fecha = p_diag_fecha,
        diag_observaciones = p_diag_observaciones
    WHERE diag_id = p_diag_id
END $$
DELIMITER ;

-- lEER
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectDiagnosis`()
BEGIN
    SELECT diag_id, tbl_citas_cita_id, diag_descripcion, diag_fecha, diag_observaciones
    FROM tbl_diagnosticos;
END $$
DELIMITER ;

-- ELIMINAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteDiagnosis`(
    IN p_diag_id INT
)
BEGIN
    DELETE FROM tbl_diagnosticos
    WHERE diag_id = p_diag_id;
END $$
DELIMITER ;


