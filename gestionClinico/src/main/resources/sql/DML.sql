-- Active: 1728862036101@@127.0.0.1@3306@gestionclinico
use gestionClinico;

INSERT INTO medicos(nombre,apellido,tipo_doc,documento,num_matricula,tel,whatsapp,mail,userName,password)values
('Jose Raul','Gomez','DNI','326949545','123453','1554345434','1123232323','Jose@gmail.com','JoseR','2323'),
('Roberto Gomez','Ronaldo','LC','32545353','323232','153935748','11222222','Roberto@gmail.com','Robertin','j434'),
('Luis Carlos','Soliz','LE','32534343','232555','155555555','115555554','Luis@Gmail.com','Luiis','ok434'),
('Saul Manuel','Velasquez','PASS','34464534','234344','1133443322','1145454545','Sal@hotmail.com','SaulMa','ok434'),
('Fernando','Rios','DNI','23232232','343333','1122334534','127675455','Fernando@gmail.com','Ferchu','43432');

INSERT INTO especialidad(nombre_especialidad)values
('Pediatra'),
('Traumatologia'),
('Kinesiologia');

INSERT INTO medico_especialidad(id_medico,id_especialidad)VALUES
(1,1),
(2,1),
(3,2),
(2,3),
(4,2),
(5,2);

INSERT INTO jornada_medico(sala,id_medico_especialidad,dia,hora_inicio,cantidad_turnos) VALUES
(1,1,'LUNES','16:00',4),
(1,3,'JUEVES','17:00',4),
(1,5,'VIERNES','16:00',4);

INSERT INTO pacientes(nombre,apellido,fenaci,direccion,tipo_doc,documento,
            telefono,whatsapp,userName,password)VALUES
  ('Juan', 'Pérez','1990-05-15','Portugal 1324', 'DNI','12345678','123456789','11232344', 'juan.pere','45rg'),
  ('María', 'González', '1985-11-20','Ecuador 3424','LC', '87654321','987654321','116667788', 'maria.gonzalez','9900'),
  ('Pedro', 'Sánchez','1992-02-28','Gral Paz 2323','LE', '54321987','456789123','115476757','pedro.sanc','8888'),
  ('Ana', 'Rodríguez','1978-06-10','San martin 545','PASS', '98765432','789456123','1144457567','ana.rodriguez','66756');

INSERT INTO registros_entrada(id_paciente,id_jornada_medico)VALUES
(1,1),
(2,3),
(3,2);

INSERT INTO registros_salida(id_registro_entrada,historia_clinica)VALUES
(1,'Paciente se presento con fuerte dolor de cabeza y se le receto una aspirina'),
(2,'Paciente se cayo de la bicicleta y se fracturo el brazo derecho'),
(3,'Paciente fue intervenido quirugicamente de la nalga');



