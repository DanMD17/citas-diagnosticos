--  PACIENTE INSERTAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertPatient`(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_celular VARCHAR(15),
    IN p_correo VARCHAR(50)
)
BEGIN
    INSERT INTO tbl_pacientes (paci_nombre, paci_apellido, paci_fecha_nacimiento, paci_direccion, paci_celular, paci_correo)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_direccion, p_celular, p_correo);
END $$
DELIMITER ;

-- ACTUALIZAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdatePatient`(
    IN p_paciente_id INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_celular VARCHAR(15),
    IN p_correo VARCHAR(50)
)
BEGIN
    UPDATE tbl_pacientes
    SET paci_nombre = p_nombre,
        paci_apellido = p_apellido,
        paci_fecha_nacimiento = p_fecha_nacimiento,
        paci_direccion = p_direccion,
        paci_celular = p_celular,
        paci_correo = p_correo
    WHERE paci_id = p_paciente_id;
END$$
DELIMITER ;

-- LEER
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectPatient`()
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

-- ELIMINAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePatient`(
    IN p_paciente_id INT
)
BEGIN
    DELETE FROM tbl_pacientes WHERE paci_id = p_paciente_id;
END$$
DELIMITER ;