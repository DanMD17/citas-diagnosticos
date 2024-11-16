-- Insertar un nuevo auxiliar
DELIMITER //
CREATE PROCEDURE spInsertAssistant(
    IN p_emp_id INT,
    IN p_aux_funcion VARCHAR(100), 
    IN p_aux_nivel_educativo VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_auxiliares (
        tbl_empleados_emp_id, 
        aux_funcion, 
        aux_nivel_educativo
    ) 
    VALUES (
        p_emp_id, 
        p_aux_funcion, 
        p_aux_nivel_educativo
    );
END//
DELIMITER ;

-- Leer todos los auxiliares
DELIMITER //
create procedure spSelectAssistants()
begin
	select aux_id, aux_funcion, aux_nivel_educativo,
    tbl_empleados_emp_id, tbl_empleados.emp_nombre
    FROM tbl_auxiliares
    INNER JOIN tbl_empleados
    ON tbl_auxiliares.tbl_empleados_emp_id = tbl_empleados.emp_id;
end//
DELIMITER ;

-- Actualizar un auxiliar
DELIMITER //
CREATE PROCEDURE spUpdateAssistant(
    IN p_aux_id INT, 
    IN p_aux_funcion VARCHAR(100), 
    IN p_aux_nivel_educativo VARCHAR(45),
    IN p_emp_id INT
)
BEGIN
    UPDATE tbl_auxiliares 
    SET aux_funcion = p_aux_funcion, 
        aux_nivel_educativo = p_aux_nivel_educativo,
        tbl_empleados_emp_id = p_emp_id
    WHERE aux_id = p_aux_id;
END//
DELIMITER ;

-- Eliminar un auxiliar
DELIMITER //
CREATE PROCEDURE spDeleteAssistant(
    IN p_aux_id INT
)
BEGIN
    DELETE FROM tbl_auxiliares 
    WHERE aux_id = p_aux_id;
END//
DELIMITER ;

-- Drop Down List
DELIMITER //
CREATE PROCEDURE spSelectAssistantsDDL()
BEGIN
    SELECT aux_id, aux_funcion
    FROM tbl_auxiliares;
END//
DELIMITER ;
