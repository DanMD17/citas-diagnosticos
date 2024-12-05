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
    SELECT cita_id, cita_fecha, cita_hora, cita_estado,
    tbl_pacientes_paci_id, tbl_pacientes.paci_nombre,
    tbl_odontologos_odo_id, tbl_odontologos.odo_especialidad,
    tbl_empleados.emp_nombre AS nombre_odo 
    FROM tbl_citas
    INNER JOIN tbl_pacientes
    ON tbl_citas.tbl_pacientes_paci_id = tbl_pacientes.paci_id
    INNER JOIN tbl_odontologos
    ON tbl_citas.tbl_odontologos_odo_id = tbl_odontologos.odo_id
    INNER JOIN tbl_empleados
    ON tbl_odontologos.tbl_empleados_emp_id = tbl_empleados.emp_id;
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
    SELECT  
        tbl_citas.cita_id,  
        tbl_citas.cita_fecha,  
        tbl_pacientes.paci_nombre,
        CONCAT(tbl_pacientes.paci_nombre, ' - ', DATE_FORMAT(tbl_citas.cita_fecha, '%d/%m/%Y')) AS nombre_y_fecha
    FROM  
        tbl_citas
    INNER JOIN  
        tbl_pacientes  
    ON  
        tbl_citas.tbl_pacientes_paci_id = tbl_pacientes.paci_id;
END //
DELIMITER ;



