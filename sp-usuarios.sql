-- Guardar a User
DELIMITER //
create procedure spInsertUser(IN p_mail VARCHAR(80),IN p_password TEXT,
IN p_salt TEXT,IN p_state VARCHAR(15),IN p_date DATE,IN p_fkrol INT,IN p_fkemployee INT)
begin
	insert into tbl_usuarios(usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,
    tbl_roles_rol_id,tbl_empleados_emp_id) 
    values(p_mail,p_password,p_salt,p_state,p_date,p_fkrol,p_fkemployee);
end//
DELIMITER ;

-- Select User by email
-------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE spSelectUserMail(IN p_mail VARCHAR(80))
BEGIN
	select usu_correo, usu_contrasena,usu_salt,usu_estado,tbl_roles.rol_id,tbl_roles.rol_nombre,
    tbl_roles.rol_descripcion,tbl_permisos.per_id,tbl_permisos.per_nombre,tbl_permisos.per_descripcion
	from tbl_usuarios
    inner join tbl_roles
    on tbl_roles.rol_id = tbl_usuarios.tbl_roles_rol_id 
    inner join tbl_roles_permisos
    on tbl_roles.rol_id = tbl_roles_permisos.tbl_roles_rol_id
    inner join tbl_permisos
    on tbl_roles_permisos.tbl_permisos_id_per = tbl_permisos.per_id
	where usu_correo = p_mail;
END//
DELIMITER //


-- Show all Users
DELIMITER //
create procedure spSelectUsers()
begin
	select usu_id,usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,
    tbl_roles_rol_id,tbl_roles.rol_nombre,tbl_empleados_emp_id,tbl_empleados.emp_nombre,
    tbl_empleados.emp_apellidos
    from tbl_usuarios
    INNER JOIN tbl_roles
	ON tbl_usuarios.tbl_roles_rol_id = tbl_roles.rol_id
	INNER JOIN tbl_empleados
	ON tbl_usuarios.tbl_empleados_emp_id = tbl_empleados.emp_id;
end//
DELIMITER ;

-- Update a User
DELIMITER //
create procedure spUpdateUser(IN p_id INT,IN p_correo VARCHAR(80),IN p_contrasena TEXT,
IN p_salt TEXT,IN p_estado VARCHAR(15),IN p_fecha_creacion DATE,IN p_fkrol INT,IN p_fkempleado INT)
begin
	update tbl_usuarios
    set usu_correo=p_correo,usu_contrasena=p_contrasena,usu_salt=p_salt,usu_estado=p_estado,usu_fecha_creacion=p_fecha_creacion,
    tbl_roles_rol_id=p_fkrol,tbl_empleados_emp_id=p_fkempleado
    where usu_id = p_id;
end//
DELIMITER ;