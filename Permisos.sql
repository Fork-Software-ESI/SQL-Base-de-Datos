USE forksoftware;

CREATE USER IF NOT EXISTS 'administrador'@'%' IDENTIFIED BY 'navp3-FS';
CREATE USER IF NOT EXISTS 'gerente_almacen'@'%' IDENTIFIED BY 'a3bkf-FS';
CREATE USER IF NOT EXISTS 'funcionario_almacen'@'%' IDENTIFIED BY '45kfl-FS';
CREATE USER IF NOT EXISTS 'chofer'@'%' IDENTIFIED BY '4k3f5-FS';

/* ADMINISTRADOR */
GRANT ALL PRIVILEGES ON forksoftware.* TO 'administrador'@'%';

/* FUNCIONARIO (SIN PERMISOS DE DELETE PORQUE SOLO SE MANEJA BAJA LÓGICA, EN CAMBIO UPDATE PARA EDITAR DELETED_AT) */
GRANT SELECT, INSERT, UPDATE ON forksoftware.paquete_estante TO 'funcionario_almacen'@'%';
GRANT SELECT, UPDATE(estado) ON forksoftware.forma TO 'funcionario_almacen'@'%';

/* GERENTE */
GRANT SELECT, INSERT, UPDATE ON forksoftware.paquete TO 'gerente_almacen'@'%';
GRANT SELECT, INSERT, UPDATE ON forksoftware.paquete_estante TO 'gerente_almacen'@'%';
GRANT SELECT, INSERT, UPDATE ON forksoftware.forma TO 'gerente_almacen'@'%';
GRANT SELECT, INSERT, UPDATE ON forksoftware.camion_plataforma TO 'gerente_almacen'@'%';
GRANT SELECT, INSERT, UPDATE ON forksoftware.lote TO 'gerente_almacen'@'%';
GRANT SELECT, INSERT, UPDATE ON forksoftware.lote_camion TO 'gerente_almacen'@'%';
GRANT SELECT, INSERT, UPDATE ON forksoftware.chofer_camion TO 'gerente_almacen'@'%';
GRANT SELECT ON Chofer TO 'gerente_almacen'@'%';
GRANT SELECT ON Camion TO 'gerente_almacen'@'%';
GRANT SELECT ON Chofer_Camion_Maneja TO 'gerente_almacen'@'%';
GRANT SELECT ON Camion_Lleva_lote TO 'gerente_almacen'@'%';
GRANT SELECT ON Camion_Plataforma_Salida TO 'gerente_almacen'@'%';

/* CHOFER */
GRANT SELECT ON Chofer_Camion TO 'chofer'@'%';
GRANT SELECT, UPDATE(Fecha_Hora_inicio) ON forksoftware.chofer_camion TO 'chofer'@'%';
GRANT SELECT, UPDATE(Fecha_Hora_Fin) ON forksoftware.chofer_camion_maneja TO 'chofer'@'%';
GRANT SELECT, UPDATE(Fecha_Hora_Llegada) ON forksoftware.camion_plataforma TO 'chofer'@'%';
GRANT SELECT, UPDATE(Fecha_Hora_salida) ON forksoftware.camion_plataforma_salida TO 'chofer'@'%';
GRANT SELECT ON forksoftware.forma TO 'chofer'@'%';
GRANT SELECT ON forksoftware.paquete TO 'chofer'@'%';
