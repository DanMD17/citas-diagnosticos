-- Insertar una nueva secretaria
DELIMITER //
CREATE PROCEDURE spInsertSecretary(
    IN p_emp_id INT, -- ID del empleado (llave foránea)
    IN p_sec_funcion VARCHAR(100), -- Función de la secretaria
    IN p_sec_anios_experiencia VARCHAR(45) -- Años de experiencia de la secretaria
)
BEGIN
    INSERT INTO tbl_secretarias (
        tbl_empleados_emp_id, 
        sec_funcion, 
        sec_anios_experiencia
    )
    VALUES (
        p_emp_id, 
        p_sec_funcion, 
        p_sec_anios_experiencia
    );
END//
DELIMITER ;

-- Leer todas las secretarias
DELIMITER //
CREATE PROCEDURE spSelectSecretaries()
BEGIN
    SELECT id_sec, sec_funcion, sec_anios_experiencia,
    tbl_empleados_emp_id, tbl_empleados.emp_nombre
    FROM tbl_secretarias
    INNER JOIN tbl_empleados
    ON tbl_secretarias.tbl_empleados_emp_id = tbl_empleados.emp_id;
END//
DELIMITER ;

-- Actualizar una secretaria
DELIMITER //
CREATE PROCEDURE spUpdateSecretary(
    IN p_sec_id INT, -- ID de la secretaria
    IN p_emp_id INT,
    IN p_sec_funcion VARCHAR(100), -- Función de la secretaria
    IN p_sec_anios_experiencia VARCHAR(45) -- Años de experiencia de la secretaria
)
BEGIN
    UPDATE tbl_secretarias 
    SET sec_funcion = p_sec_funcion, 
        sec_anios_experiencia = p_sec_anios_experiencia,
        tbl_empleados_emp_id = p_emp_id
    WHERE id_sec = p_sec_id;
END//
DELIMITER ;

-- Eliminar una secretaria
DELIMITER //
CREATE PROCEDURE spDeleteSecretary(
    IN p_sec_id INT -- ID de la secretaria
)
BEGIN
    DELETE FROM tbl_secretarias 
    WHERE id_sec = p_sec_id;
END//
DELIMITER ;
