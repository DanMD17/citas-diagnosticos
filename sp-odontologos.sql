-- Insertar un nuevo odontólogo
DELIMITER $$
CREATE PROCEDURE spInsertDentist(
    IN p_odo_especialidad VARCHAR(100), 
    IN p_emp_id INT
)
BEGIN
    INSERT INTO tbl_odontologos (odo_especialidad, tbl_empleados_emp_id)
    VALUES (p_odo_especialidad, p_emp_id);
END $$
DELIMITER ;

-- Leer todos los odontólogos
DELIMITER $$
CREATE PROCEDURE spSelectDentists()
BEGIN
    SELECT odo_id, odo_especialidad,
    tbl_empleados_emp_id, tbl_empleados.emp_nombre
    FROM tbl_odontologos
    INNER JOIN tbl_empleados
    ON tbl_odontologos.tbl_empleados_emp_id = tbl_empleados.emp_id;
END $$
DELIMITER ;

-- Actualizar un odontólogo
DELIMITER $$
CREATE PROCEDURE spUpdateDentist(
    IN p_odo_id INT, 
    IN p_odo_especialidad VARCHAR(100), 
    IN p_emp_id INT
)
BEGIN
    UPDATE tbl_odontologos 
    SET odo_especialidad = p_odo_especialidad, tbl_empleados_emp_id = p_emp_id
    WHERE odo_id = p_odo_id;
END $$
DELIMITER ;

-- Eliminar un odontólogo
DELIMITER $$
CREATE PROCEDURE spDeleteDentist(IN p_odo_id INT)
BEGIN
    DELETE FROM tbl_odontologos WHERE odo_id = p_odo_id;
END $$
DELIMITER ;

-- Drop Down List
DELIMITER $$
CREATE PROCEDURE spSelectDentistsDDL()
BEGIN
    SELECT odo_id, tbl_empleados.emp_nombre
    FROM tbl_odontologos
    INNER JOIN tbl_empleados
    ON tbl_odontologos.tbl_empleados_emp_id = tbl_empleados.emp_id;
END $$
DELIMITER ;
