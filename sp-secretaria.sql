-- Insertar una nueva secretaria
DELIMITER $$
CREATE PROCEDURE spInsertSecretariat(
	IN emp_id INT,
    IN sec_funcion VARCHAR(100),
    IN sec_anios_experiencia VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_secretarias (tbl_empleado_emp_id ,sec_funcion, sec_anios_experiencia)
    VALUES (emp_id, sec_funcion, sec_anios_experiencia);
END $$
DELIMITER ;

-- Leer todas las secretarias
DELIMITER $$
CREATE PROCEDURE spSelectSecretariat()
BEGIN
    SELECT * FROM tbl_secretarias;
END $$
DELIMITER ;

-- Actualizar una secretaria
DELIMITER $$
CREATE PROCEDURE spUpdateSecretariat(
    IN sec_id INT, 
    IN sec_funcion VARCHAR(100),
    IN sec_anios_experiencia VARCHAR(45)
)
BEGIN
    UPDATE tbl_secretarias 
    SET sec_funcion = sec_funcion, sec_anios_experiencia = sec_anios_experiencia
    WHERE sec_id = sec_id;
END $$
DELIMITER ;

-- Eliminar una secretaria
DELIMITER $$
CREATE PROCEDURE spDeleteSecretariat(IN sec_id INT)
BEGIN
    DELETE FROM tbl_secretarias WHERE sec_id = sec_id;
END $$
DELIMITER ;