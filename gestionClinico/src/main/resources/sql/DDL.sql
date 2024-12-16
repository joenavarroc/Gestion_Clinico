-- Active: 1714186397700@@127.0.0.1@3306@gestionclinico
drop database if exists gestionClinico;
create database gestionClinico;
use gestionClinico;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS medicos;
DROP Table IF EXISTS especialidad;
DROP Table IF EXISTS medico_especialidad;
DROP Table IF EXISTS jornada_medico;
DROP TABLE IF EXISTS pacientes;
DROP TABLE IF EXISTS turnos;
DROP TABLE IF EXISTS registro_Entrada;
DROP TABLE IF EXISTS registro_Salida; 



-- TABLA USUARIO(ADMIN)
CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL                                      
);
ALTER TABLE users
    ADD CONSTRAINT U_User_Username
    UNIQUE(username);

-- ************************************************************************************
-- TABLAS MÉDICO///ESPECIALIDAD (Un médico puede tener várias especialidades
-- y una especialidad vários médicos)
CREATE TABLE medicos(
    id_Medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    tipo_doc ENUM('DNI','LC','LE','PASS') NOT NULL DEFAULT 'DNI',
    documento VARCHAR(10) NOT NULL,
    num_Matricula VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    whatsapp VARCHAR(50) NOT NULL,
    mail VARCHAR(50) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT true 
);
 
ALTER TABLE medicos
    ADD CONSTRAINT CK_Medico_Nombre_Length
    CHECK(LENGTH(nombre)>=3);
ALTER TABLE medicos
    ADD CONSTRAINT CK_Medicos_Apellido_Length
    CHECK(LENGTH(apellido)>=3);
ALTER TABLE medicos
    ADD CONSTRAINT CK_Medicos_NumMatricula_Length
    CHECK(LENGTH(num_Matricula)>=5);
ALTER TABLE medicos
    ADD CONSTRAINT U_Medicos_NumMatricula
    UNIQUE(num_Matricula);
ALTER TABLE medicos
    ADD CONSTRAINT U_Medicos_userName
    UNIQUE(userName);
ALTER TABLE medicos
    ADD CONSTRAINT U_Medicos_documento
    UNIQUE(tipo_doc,documento);

-- -----------------------------------------------------
 CREATE TABLE especialidad(
    id_Especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_Especialidad VARCHAR(50) NOT NULL -- 
 );
 ALTER TABLE especialidad
    ADD CONSTRAINT CK_Especialidad_Nombre_Length
    CHECK(LENGTH(nombre_especialidad)>=3);
-- -----------------------------------------------------
-- Tabla intermedia donde definimos los medicos con sus especialidades// para usarlos en la tabla(agenda)
 CREATE TABLE medico_especialidad(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    id_especialidad INT NOT NULL
 );
ALTER TABLE medico_especialidad
    ADD CONSTRAINT U_Medico_Especialidad
    UNIQUE(id_medico, id_especialidad);

ALTER TABLE medico_especialidad
    ADD CONSTRAINT FK_Medico_Especialidad_Id_medico
    FOREIGN KEY(id_medico)
    REFERENCES medicos(id_Medico);
ALTER TABLE medico_especialidad
    ADD CONSTRAINT FK_Medico_Especialidad_Id_Especialidad
    FOREIGN KEY(id_especialidad)
    REFERENCES especialidad(id_especialidad);
-- ********************************************************************************
-- Tabla agenda//  archivamos los horarios de atencion con sus respectivas especialidad,Dr,
-- sala(se refiere a cantidad de atencion en simultaneo) y horario....
-- cantidad de turnos// cantidad de personas que se atenderan x turno
CREATE TABLE jornada_medico(
    id_jornada_medico INT AUTO_INCREMENT PRIMARY KEY,
    sala VARCHAR(20)NOT NULL,
    id_medico_especialidad INT NOT NULL,
    dia ENUM('LUNES','MARTES','MIERCOLES','JUEVES',
            'VIERNES','SABADO','DOMINGO')NOT NULL,
    hora_inicio TIME NOT NULL,
    cantidad_turnos int NOT NULL
    );
-- Restriccion que no permite repetir un horario en el mismo dia y misma sala
    ALTER TABLE jornada_medico
    ADD CONSTRAINT U_Jornada_medico
    UNIQUE(sala,dia,hora_Inicio);

    ALTER TABLE jornada_medico
    ADD CONSTRAINT FK_Jornada_Medico_Id_Medico_Especialidad
    FOREIGN KEY(id_medico_especialidad)
    REFERENCES medico_especialidad(id);

-- ********************************************************************************
CREATE TABLE pacientes(
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fenaci DATE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    tipo_doc ENUM('DNI','LC','LE','PASS') NOT NULL DEFAULT 'DNI',
    documento VARCHAR(10) NOT NULL, 
    telefono VARCHAR(50),
    whatsapp VARCHAR(50) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT true -- Tiene que tener un valor de 255 por la incriptacion de la clave
);

ALTER TABLE pacientes
    ADD CONSTRAINT CK_Pacientes_Nombre_Length
    CHECK(LENGTH(nombre)>=3);
ALTER TABLE pacientes
    ADD CONSTRAINT CK_Pacientes_Apellido_Length
    CHECK(LENGTH(apellido)>=3);
ALTER TABLE pacientes
    ADD CONSTRAINT CK_Pacientes_Documento_Length
    CHECK(LENGTH(documento)>=5);
ALTER TABLE pacientes
    ADD CONSTRAINT U_Pacientes_Documento
    UNIQUE(tipo_doc, documento);
ALTER TABLE pacientes
    ADD CONSTRAINT U_Pacientes_UserName
    UNIQUE(userName);

-- ***************************************************************************
-- Tabla donde gestionamos los turnos/  cantidad de turnos que daremos x horarios 
-- y se puedan ir restando al seleccionarlos
CREATE TABLE turnos(
id_turno INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT NOT NULL,
id_jornada_medico INT NOT NULL,
numero_turno INT NOT NULL,
fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE turnos
    ADD CONSTRAINT FK_Turnos_Id_Pacientes
    FOREIGN KEY(id_paciente)
    REFERENCES pacientes(id_paciente);
ALTER TABLE turnos
    ADD CONSTRAINT FK_Turnos_Id_Jornada_Medico
    FOREIGN KEY(id_jornada_medico)
    REFERENCES jornada_medico(id_jornada_medico);

--QUEDA PENDIENTE ANALIZAR ESA TABLA



-- ***************************************************************************
-- Tabla donde creamos el ingreso del paciente en tiempo real...REGISTRO
CREATE TABLE registros_entrada(
id_registro_entrada INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT NOT NULL,
id_jornada_medico INT NOT NULL,
fecha_actual DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE registros_entrada
    ADD CONSTRAINT FK_Registro_entrada_Id_Paciente
    FOREIGN KEY(id_paciente)
    REFERENCES pacientes(id_paciente);
ALTER TABLE registros_entrada
    ADD CONSTRAINT FK_Registro_Entrada_Id_Jornada_Medico
    FOREIGN KEY(id_jornada_medico)
    REFERENCES jornada_medico(id_jornada_medico);

-- ***************************************************************************
-- Tabla donde creamos la salida del cliente  y guardamos su historia clinica/observaciones
CREATE TABLE registros_salida(
    id_registro_salida INT AUTO_INCREMENT PRIMARY KEY,
    id_registro_entrada INT NOT NULL,
    fecha_actual DATETIME DEFAULT CURRENT_TIMESTAMP,
    historia_clinica TEXT NOT NULL
);
ALTER TABLE registros_salida
    ADD CONSTRAINT FK_Registro_Salida_Id_Registro_Entrada
    FOREIGN KEY(id_registro_entrada)
    REFERENCES registros_entrada(id_registro_entrada);
