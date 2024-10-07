-- Insertar un nuevo empleado
DELIMITER $$
CREATE PROCEDURE spInsertEmployee(
    IN emp_identificacion VARCHAR(15), 
    IN emp_nombre VARCHAR(45), 
    IN emp_apellidos VARCHAR(80),
    IN emp_celular VARCHAR(15),
    IN emp_correo VARCHAR(45), 
    IN emp_direccion VARCHAR(100)
)
BEGIN
    INSERT INTO tbl_empleados (emp_identificacion, emp_nombre, emp_apellidos, emp_celular, emp_correo, 
    emp_direccion)
    VALUES (emp_identificacion, emp_nombre, emp_apellidos, emp_celular, emp_correo, emp_direccion);
END $$
DELIMITER ;

-- Leer todos los empleados
DELIMITER $$
CREATE PROCEDURE spSelectEmployee()
BEGIN
    SELECT * FROM tbl_empleados;
END $$
DELIMITER ;

-- Actualizar un empleado
DELIMITER $$
CREATE PROCEDURE spUpdateEmployee(
    IN p_emp_id INT, 
    IN p_emp_identificacion VARCHAR(15), 
    IN p_emp_nombre VARCHAR(45), 
    IN p_emp_apellidos VARCHAR(45),
    IN p_emp_celular VARCHAR(15),
    IN p_emp_correo VARCHAR(45), 
    IN p_emp_direccion VARCHAR(100)
)
BEGIN
    UPDATE tbl_empleados 
    SET emp_identificacion = p_emp_identificacion, emp_nombre = p_emp_nombre, emp_apellidos = p_emp_apellidos, 
    emp_celular = p_emp_celular, emp_correo = p_emp_correo, emp_direccion = p_emp_direccion
    WHERE emp_id = p_emp_id;
END $$
DELIMITER ;

-- Eliminar un empleado
DELIMITER $$
CREATE PROCEDURE spDeleteEmployee(IN p_emp_id INT)
BEGIN
    DELETE FROM tbl_empleados WHERE emp_id = p_emp_id;
END $$
DELIMITER ;