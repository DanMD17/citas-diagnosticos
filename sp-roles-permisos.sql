-- Procedimiento para seleccionar todos los Permisos Roles
DELIMITER //
CREATE PROCEDURE spSelectPermisoRol()
BEGIN
	select rol_permiso,tbl_roles_rol_id,tbl_roles.rol_nombre,tbl_permisos_per_id,
    tbl_permisos.per_nombre,per_rol_fecha_asignacion
    from tbl_roles_permisos
    inner join tbl_roles
    on tbl_roles.rol_id = tbl_roles_permisos.tbl_roles_rol_id
    inner join tbl_permisos
    on tbl_permisos.per_id = tbl_roles_permisos.tbl_permisos_per_id;
END//
DELIMITER ;

-- Procedimiento para Insertar un Permiso Rol
DELIMITER //
CREATE PROCEDURE spInsertPermisoRol(IN p_rol_id INT, p_permiso_id INT,IN p_date DATE)
BEGIN
    insert into tbl_roles_permisos(tbl_roles_rol_id,tbl_permisos_per_id,per_rol_fecha_asignacion) values(p_rol_id,p_permiso_id,p_date);
END//
DELIMITER ;

-- Procedimiento para Actualizar un Permiso Rol
DELIMITER //
create procedure spUpdatePermisoRol(IN p_rol_permiso INT, IN p_fkrol INT,IN p_fkpermiso INT,IN p_date DATE)
begin
	update tbl_roles_permisos
    set tbl_roles_rol_id = p_fkrol, tbl_permisos_per_id = p_fkpermiso, per_rol_fecha_asignacion = p_date
    where rol_permiso = p_rol_permiso;
end//
DELIMITER ;

-- Procedimiento para Eliminar un permiso rol
DELIMITER //
create procedure spDeletePermisoRol(IN p_id INT)
begin
	delete from tbl_roles_permisos where rol_permiso = p_id;
end//
DELIMITER ;