-- todos los medicos registrados
SELECT * from medicos;

-- *********************************************************

--todas las especialidades y servicios cargados

SELECT * from especialidad;
--*********************************************************
-- Las especialidades asignadas a cada profesional
SELECT 
    m.nombre AS nombre_medico, 
    m.apellido AS apellido_medico, 
    e.nombre_Especialidad
FROM 
    medicos m
JOIN 
    medico_especialidad me ON m.id_Medico = me.id_medico
JOIN 
    especialidad e ON me.id_especialidad = e.id_Especialidad;
-- *******************************************************
--- ver la agenda completa nombre y apellido del profesional y au especialidad

SELECT 
    jm.id_jornada_medico AS jornada_id,
    m.nombre AS nombre_medico, 
    m.apellido AS apellido_medico, 
    e.nombre_Especialidad,
    jm.dia,
    jm.hora_inicio
FROM 
    jornada_medico jm
JOIN 
    medico_especialidad me ON jm.id_medico_especialidad = me.id
JOIN 
    medicos m ON me.id_medico = m.id_Medico
JOIN 
    especialidad e ON me.id_especialidad = e.id_Especialidad;

-- ****************************************************************
-- Todos los pacientes Registrados
select * from pacientes;
-- ****************************************************************
-- REGISTRO DE SALIDA Trae Todos los registros de los paciente que ingresan, horario en tiempo real,
-- 
SELECT 
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    re.fecha_actual AS fecha_entrada,
    jm.sala,
    jm.dia,
    jm.hora_inicio
FROM 
    pacientes p
JOIN 
    registros_entrada re ON p.id_paciente = re.id_paciente
JOIN 
    jornada_medico jm ON re.id_jornada_medico = jm.id_jornada_medico;

-- *****************************************************************
-- REGISTRO DE SALIDA Trae todos los pacientes con nombre y apellido, momento de llegada y registro de salida y su historia clinica
SELECT 
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    re.fecha_actual AS fecha_entrada,
    jm.sala,
    jm.dia,
    jm.hora_inicio,
    rs.fecha_actual AS fecha_salida,
    rs.historia_clinica
FROM 
    pacientes p
JOIN 
    registros_entrada re ON p.id_paciente = re.id_paciente
JOIN 
    jornada_medico jm ON re.id_jornada_medico = jm.id_jornada_medico
JOIN 
    registros_salida rs ON re.id_registro_entrada = rs.id_registro_entrada;
