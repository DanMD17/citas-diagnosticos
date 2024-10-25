-- Insertar una nueva cita
DELIMITER //
CREATE PROCEDURE spInsertQuote(
    IN p_cita_fecha DATE, 
    IN p_cita_hora TIME, 
    IN p_cita_estado VARCHAR(20), 
    IN p_paci_id INT, 
    IN p_odo_id INT
)
BEGIN
    INSERT INTO tbl_citas (
        cita_fecha, 
        cita_hora, 
        cita_estado, 
        tbl_pacientes_paci_id, 
        tbl_odontologos_odo_id
    ) 
    VALUES (
        p_cita_fecha, 
        p_cita_hora, 
        p_cita_estado, 
        p_paci_id, 
        p_odo_id
    );
END//
DELIMITER ;

-- Leer todas las citas
DELIMITER //
CREATE PROCEDURE spSelectQuotes()
BEGIN
    SELECT * 
    FROM tbl_citas;
END//
DELIMITER ;

-- Actualizar una cita
DELIMITER //
CREATE PROCEDURE spUpdateQuote(
    IN p_cita_id INT, 
    IN p_cita_fecha DATE, 
    IN p_cita_hora TIME, 
    IN p_cita_estado VARCHAR(20), 
    IN p_paci_id INT, 
    IN p_odo_id INT
)
BEGIN
    UPDATE tbl_citas 
    SET cita_fecha = p_cita_fecha, 
        cita_hora = p_cita_hora, 
        cita_estado = p_cita_estado, 
        tbl_pacientes_paci_id = p_paci_id, 
        tbl_odontologos_odo_id = p_odo_id
    WHERE cita_id = p_cita_id;
END//
DELIMITER ;

-- Eliminar una cita
DELIMITER //
CREATE PROCEDURE spDeleteQuote(
    IN p_cita_id INT
)
BEGIN
    DELETE FROM tbl_citas 
    WHERE cita_id = p_cita_id;
END//
DELIMITER ;

-- Drop Down List
DELIMITER //
CREATE PROCEDURE spSelectQuotesDDL()
BEGIN
    SELECT cita_id, cita_estado
    FROM tbl_citas;
END//
DELIMITER ;
