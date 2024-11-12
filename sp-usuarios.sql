-- Guardar a User
DELIMITER //
create procedure spInsertUser(IN p_mail VARCHAR(80),IN p_password TEXT,
IN p_salt TEXT,IN p_state VARCHAR(15),IN p_date DATE,IN p_fkrol INT,IN p_fkemployee INT)
begin
	insert into tbl_usuario(usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,
    tbl_rol_rol_id,tbl_empleado_emp_id) 
    values(p_mail,p_password,p_salt,p_state,p_date,p_fkrol,p_fkemployee);
end//
DELIMITER ;

-- Select User by email
DELIMITER //
CREATE PROCEDURE spSelectUserMail(IN p_mail VARCHAR(80))
BEGIN
	select usu_correo, usu_contrasena,usu_salt,usu_estado,tbl_rol.rol_nombre,tbl_permiso.per_id
	from tbl_usuario
    inner join tbl_rol
    on tbl_rol.rol_id = tbl_usuario.tbl_rol_rol_id 
    inner join tbl_rol_permiso
    on tbl_rol.rol_id = tbl_rol_permiso.tbl_rol_rol_id
    inner join tbl_permiso
    on tbl_rol_permiso.tbl_permiso_per_id = tbl_permiso.per_id
	where usu_correo = p_mail;
END//
DELIMITER ;

-- Show all Users
DELIMITER //
create procedure spSelectUsers()
begin
	select usu_id,usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,
    tbl_rol_rol_id,tbl_rol.rol_nombre,tbl_empleado_emp_id,tbl_empleado.emp_nombres,
    tbl_empleado.emp_apellidos
    from tbl_usuario
    INNER JOIN tbl_rol
	ON tbl_usuario.tbl_rol_rol_id = tbl_rol.rol_id
	INNER JOIN tbl_empleado
	ON tbl_usuario.tbl_empleado_emp_id = tbl_empleado.emp_id;
end//
DELIMITER ;

-- Update a User
DELIMITER //
create procedure spUpdateUser(IN p_id INT,IN p_correo VARCHAR(80),IN p_contrasena TEXT,
IN p_salt TEXT,IN p_estado VARCHAR(15),IN p_fecha_creacion DATE,IN p_fkrol INT,IN p_fkempleado INT)
begin
	update tbl_usuario
    set usu_correo=p_correo,usu_contrasena=p_contrasena,usu_salt=p_salt,usu_estado=p_estado,usu_fecha_creacion=p_fecha_creacion,
    tbl_rol_rol_id=p_fkrol,tbl_empleado_emp_id=p_fkempleado
    where usu_id = p_id;
end//
DELIMITER ;