-- Insertar un nuevo paciente
DELIMITER $$
CREATE PROCEDURE spInsertPatient(
    IN p_paci_nombre VARCHAR(50),
    IN p_paci_apellido VARCHAR(50),
    IN p_paci_fecha_nacimiento DATE,
    IN p_paci_direccion VARCHAR(100),
    IN p_paci_celular VARCHAR(15),
    IN p_paci_correo VARCHAR(50)
)
BEGIN
    INSERT INTO tbl_pacientes (paci_nombre, paci_apellido, paci_fecha_nacimiento, paci_direccion, paci_celular, paci_correo)
    VALUES (p_paci_nombre, p_paci_apellido, p_paci_fecha_nacimiento, p_paci_direccion, p_paci_celular, p_paci_correo);
END $$
DELIMITER ;

-- Actualizar un paciente
DELIMITER $$
CREATE PROCEDURE spUpdatePatients(
    IN p_paciente_id INT,
    IN p_paci_nombre VARCHAR(50),
    IN p_paci_apellido VARCHAR(50),
    IN p_paci_fecha_nacimiento DATE,
    IN p_paci_direccion VARCHAR(100),
    IN p_paci_celular VARCHAR(15),
    IN p_paci_correo VARCHAR(50)
)
BEGIN
    UPDATE tbl_pacientes
    SET paci_nombre = p_paci_nombre,
        paci_apellido = p_paci_apellido,
        paci_fecha_nacimiento = p_paci_fecha_nacimiento,
        paci_direccion = p_paci_direccion,
        paci_celular = p_paci_celular,
        paci_correo = p_paci_correo
    WHERE paci_id = p_paciente_id;
END $$
DELIMITER ;

-- Leer todos los pacientes
DELIMITER $$
CREATE PROCEDURE spSelectPatient()
BEGIN
    SELECT 
        paci_id, 
        paci_nombre, 
        paci_apellido, 
        paci_fecha_nacimiento, 
        paci_direccion, 
        paci_celular, 
        paci_correo
    FROM tbl_pacientes;
END $$
DELIMITER ;

-- Eliminar un paciente
DELIMITER $$
CREATE PROCEDURE spDeletePatient(
    IN p_paciente_id INT
)
BEGIN
    DELETE FROM tbl_pacientes WHERE paci_id = p_paciente_id;
END $$
DELIMITER ;

-- Drop Down List
DELIMITER $$
CREATE PROCEDURE spSelectPatientsDDL()
BEGIN
    SELECT paci_id, paci_nombre
    FROM tbl_pacientes;
END $$
DELIMITER ;

-- Cuenta cuántos pacientes existen

DELIMITER //
CREATE PROCEDURE spSelectCountPatients(OUT total_pacientes INT)
BEGIN
    SELECT COUNT(paci_id) INTO total_pacientes
    FROM tbl_pacientes;
END//
DELIMITER ;
