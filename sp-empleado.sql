-- Insertar un nuevo empleado
DELIMITER $$
CREATE PROCEDURE InsertEmpleado(
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
CREATE PROCEDURE GetEmpleados()
BEGIN
    SELECT * FROM tbl_empleados;
END $$
DELIMITER ;

-- Actualizar un empleado
DELIMITER $$
CREATE PROCEDURE UpdateEmpleado(
    IN emp_id INT, 
    IN emp_identificacion VARCHAR(15), 
    IN emp_nombre VARCHAR(45), 
    IN emp_apellidos VARCHAR(45),
    IN emp_celular VARCHAR(15),
    IN emp_correo VARCHAR(45), 
    IN emp_direccion VARCHAR(100)
)
BEGIN
    UPDATE tbl_empleados 
    SET emp_identificacion = emp_identificacion, emp_nombre = emp_nombre, emp_apellidos = emp_apellidos, 
    emp_celular = emp_celular, emp_correo = emp_correo, emp_direccion = emp_direccion
    WHERE emp_id = emp_id;
END $$
DELIMITER ;

-- Eliminar un empleado
DELIMITER $$
CREATE PROCEDURE DeleteEmpleado(IN emp_id INT)
BEGIN
    DELETE FROM tbl_empleados WHERE emp_id = emp_id;
END $$
DELIMITER ;