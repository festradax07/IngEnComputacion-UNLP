-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS bodas_servicio;

-- Crear el usuario (si no existe)
CREATE USER IF NOT EXISTS 'bodas_dba'@'localhost' IDENTIFIED BY '321';

-- Dar todos los permisos sobre la base de datos correcta
GRANT ALL PRIVILEGES ON bodas_servicio.* TO 'bodas_dba'@'localhost';

-- Aplicar los cambios
FLUSH PRIVILEGES;