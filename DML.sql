USE `tfg`;

INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('1', '1', 'DNI', 'Tipos de Documento');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('2', '1', 'Pasaporte', 'Tipos de Documento');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('3', '1', 'LE', 'Tipos de Documento');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('4', '2', 'Normal', 'Tipos de Prioridad para Turnos');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('5', '2', 'Alta', 'Tipos de Prioridad para Turnos');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('6', '3', 'Abierto', 'Tipos de Estado para Turnos');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('7', '3', 'Cerrado', 'Tipos de Estado para Turnos');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('8', '4', 'Tatuador', 'Tipos de Roles');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('9', '4', 'Cliente', 'Tipos de Roles');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('10', '4', 'Encargado de Compras', 'Tipos de Roles');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('11', '4', 'Recepcionista', 'Tipos de Roles');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('12', '5', 'Acuarela (Watercolor)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('13', '5', 'Anime (Manga Comic)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('14', '5', 'Biomechanical', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('15', '5', 'Blackwork', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('16', '5', 'Celta (Celtic)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('17', '5', 'Chicano', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('18', '5', 'Japonés (Oriental)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('19', '5', 'Lettering', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('20', '5', 'Maori', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('21', '5', 'Neotradicional (Neotraditional)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('22', '5', 'New School', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('23', '5', 'Old School (Traditional)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('24', '5', 'Puntillismo (Dotwork)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('25', '5', 'Realismo (Black and Grey)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('26', '5', 'Realismo (Color)', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('27', '5', 'Sketch', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('28', '5', 'Trash Polka', 'Tipos de Tatuajes');
INSERT INTO `tfg`.`categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES ('29', '5', 'Tribal', 'Tipos de Tatuajes');

-- Password: Admin1234
-- Password: Gabriel1234
-- Password: Javier1234
-- Password: Ludmila1234
-- Password: Marcelo1234
-- Password: Nahuel1234
INSERT INTO `tfg`.`usuarios` (`nombre`, `contrasenia_hash`, `ultimo_cambio`, `activo`) VALUES ('admin', '$2a$10$IM5zqoWQ50rYA9Sjh/xak.WPBA4XfxjZbb5qwK.nbrT.21GS2rfJa', '2020-07-20 11:13:15', '1');
INSERT INTO `tfg`.`usuarios` (`nombre`, `contrasenia_hash`, `ultimo_cambio`, `activo`) VALUES ('gdroguett', '$2a$10$0nJjqyoX0R9YkWykagQx1OwxESSCYYhbp7vGyzm9Fhlso/U4dG5Iy', '2020-07-20 11:13:15', '1');
INSERT INTO `tfg`.`usuarios` (`nombre`, `contrasenia_hash`, `ultimo_cambio`, `activo`) VALUES ('jmilei', '$2a$10$RrH9b663dggUe2tQC.XK6.YRTYz8GLRrxsGNMENmiTj2iCRoZ4qti', '2020-07-20 11:13:15', '1');
INSERT INTO `tfg`.`usuarios` (`nombre`, `contrasenia_hash`, `ultimo_cambio`, `activo`) VALUES ('lserra', '$2a$10$TQJ49CYqxdFkHH9aRnSwHO9uQy7fzkuV2qX2.WjZarOIC78uEEfFi', '2020-07-20 11:13:15', '1');
INSERT INTO `tfg`.`usuarios` (`nombre`, `contrasenia_hash`, `ultimo_cambio`, `activo`) VALUES ('mrenzo', '$2a$10$z7IUjpUhz2iaBI4exkhYd.4T64sjN4Ms07BWY4w21HgcROux2WkQy', '2020-07-20 11:13:15', '1');
INSERT INTO `tfg`.`usuarios` (`nombre`, `contrasenia_hash`, `ultimo_cambio`, `activo`) VALUES ('ndroguett', '$2a$10$uTsoYZIN1mRLzBzwke9sye/GB26cX39hEYRukdm82ea6/YN5yunIC', '2020-07-20 11:13:15', '1');

INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('1', '95933843', 'Ezequiel', 'Reyes', '388-3432000', 'Parana 487', 'eezequielq@micorreo.com' ,'1', '9');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('2', '95933843', 'Charles', 'Ramonda', '351-5908312', 'Bv. Illia 444', 'cramonda@micorreo.com' ,'1', '9');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('3', '95933843', 'Leonard', 'di Prinzio', '351-6781290', 'Bv. San Juan 394', 'ldiprinzio@micorreo.com' ,'1', '9');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('4', '95933843', 'Ferdinand', 'Frias', '351-3198533', 'Chile 144', 'ffrias@micorreo.com' ,'1', '9');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('5', '95933843', 'Callixtus', 'Maldonado', '351-4667891', 'Av. Velez Sarfield 333', 'cmaldonado@micorreo.com' ,'1', '9');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('6', '95933843', 'Paul', 'Godino', '351-6567700', 'Av. Pueyrredon 144', 'pgodino@micorreo.com' ,'1', '9');

INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('7', '93354553', 'Gaby', 'Droguett', '351-4108811', 'Rondeau 587', 'gabydroguett@micorreo.com' ,'1', '8');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('8', '98214560', 'Javier', 'Milei', '351-5961099', 'Obispo Salguero 300', 'javimilei@micorreo.com' ,'1', '10');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('9', '99488711', 'Lu', 'Serra', '351-6672201', 'Balcarce 222', 'luserra@micorreo.com' ,'1', '11');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('10', '93958889', 'Marcelo', 'Renzo', '351-3267541', 'San Lorenzo 756', 'marrenzo@micorreo.com' ,'1', '8');
INSERT INTO `tfg`.`personas` (`id`, `numero_documento`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo_electronico` ,`categorias_id_tipo_documento`, `categorias_id_rol`) VALUES ('11', '98800536', 'Nahuel', 'Droguett', '351-6989044', 'Ituzaingo 484', 'nahudroguett@micorreo.com' ,'1', '8');

INSERT INTO `tfg`.`encargados_compras` (`id`, `usuarios_nombre`, `personas_id`) VALUES ('1', 'jmilei', '8');

INSERT INTO `tfg`.`recepcionistas` (`id`, `usuarios_nombre`, `personas_id`) VALUES ('1', 'lserra', '9');

INSERT INTO `tfg`.`tatuadores` (`id`, `usuarios_nombre`, `personas_id`, `pseudonimo`, `color_hex`) VALUES ('1', 'gdroguett', '7', 'DRA', '#FF9B9B');
INSERT INTO `tfg`.`tatuadores` (`id`, `usuarios_nombre`, `personas_id`, `pseudonimo`, `color_hex`) VALUES ('2', 'mrenzo', '10', 'Marchi Renzo', '#FF0000');
INSERT INTO `tfg`.`tatuadores` (`id`, `usuarios_nombre`, `personas_id`, `pseudonimo`, `color_hex`) VALUES ('3', 'ndroguett', '11', 'NQK', '#FF00FF');

INSERT INTO `tfg`.`fichas_clinica_piel` (`id`, `psoriasis`, `eccema`, `queloide`, `comentario`) VALUES ('1', '0', '0', '1', 'No aplica');
INSERT INTO `tfg`.`fichas_clinica_ets` (`id`, `vih`, `sifilis`, `hepatitis_b`, `hpv`, `comentario`) VALUES ('1', '0', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinicas` (`id`, `grupo_sanguineo`, `factor_rh`, `alergias`, `problemas_cardiacos`, `comentarios`, `fichas_clinica_ets_id`, `fichas_clinica_piel_id`) VALUES ('1', '0', '+', 'Látex', 'No', 'No aplica', '1', '1');

INSERT INTO `tfg`.`fichas_clinica_piel` (`id`, `psoriasis`, `eccema`, `queloide`, `comentario`) VALUES ('2', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinica_ets` (`id`, `vih`, `sifilis`, `hepatitis_b`, `hpv`, `comentario`) VALUES ('2', '0', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinicas` (`id`, `grupo_sanguineo`, `factor_rh`, `alergias`, `problemas_cardiacos`, `comentarios`, `fichas_clinica_ets_id`, `fichas_clinica_piel_id`) VALUES ('2', 'A', '+', 'Ninguno', 'No', 'No aplica', '2', '2');

INSERT INTO `tfg`.`fichas_clinica_piel` (`id`, `psoriasis`, `eccema`, `queloide`, `comentario`) VALUES ('3', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinica_ets` (`id`, `vih`, `sifilis`, `hepatitis_b`, `hpv`, `comentario`) VALUES ('3', '0', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinicas` (`id`, `grupo_sanguineo`, `factor_rh`, `alergias`, `problemas_cardiacos`, `comentarios`, `fichas_clinica_ets_id`, `fichas_clinica_piel_id`) VALUES ('3', 'A', '-', 'Pelo de Animales', 'No', 'No aplica', '3', '3');

INSERT INTO `tfg`.`fichas_clinica_piel` (`id`, `psoriasis`, `eccema`, `queloide`, `comentario`) VALUES ('4', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinica_ets` (`id`, `vih`, `sifilis`, `hepatitis_b`, `hpv`, `comentario`) VALUES ('4', '0', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinicas` (`id`, `grupo_sanguineo`, `factor_rh`, `alergias`, `problemas_cardiacos`, `comentarios`, `fichas_clinica_ets_id`, `fichas_clinica_piel_id`) VALUES ('4', 'B', '-', 'Polen', 'No', 'No aplica', '4', '4');

INSERT INTO `tfg`.`fichas_clinica_piel` (`id`, `psoriasis`, `eccema`, `queloide`, `comentario`) VALUES ('5', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinica_ets` (`id`, `vih`, `sifilis`, `hepatitis_b`, `hpv`, `comentario`) VALUES ('5', '0', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinicas` (`id`, `grupo_sanguineo`, `factor_rh`, `alergias`, `problemas_cardiacos`, `comentarios`, `fichas_clinica_ets_id`, `fichas_clinica_piel_id`) VALUES ('5', 'B', '-', 'Sol', 'No', 'No aplica', '5', '5');

INSERT INTO `tfg`.`fichas_clinica_piel` (`id`, `psoriasis`, `eccema`, `queloide`, `comentario`) VALUES ('6', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinica_ets` (`id`, `vih`, `sifilis`, `hepatitis_b`, `hpv`, `comentario`) VALUES ('6', '0', '0', '0', '0', 'No aplica');
INSERT INTO `tfg`.`fichas_clinicas` (`id`, `grupo_sanguineo`, `factor_rh`, `alergias`, `problemas_cardiacos`, `comentarios`, `fichas_clinica_ets_id`, `fichas_clinica_piel_id`) VALUES ('6', 'AB', '+', 'Ninguno', 'Si', 'No aplica', '6', '6');

INSERT INTO `tfg`.`clientes` (`id`, `fichas_clinicas_id`, `personas_id`) VALUES ('1', '1', '1');
INSERT INTO `tfg`.`clientes` (`id`, `fichas_clinicas_id`, `personas_id`) VALUES ('2', '2', '2');
INSERT INTO `tfg`.`clientes` (`id`, `fichas_clinicas_id`, `personas_id`) VALUES ('3', '3', '3');
INSERT INTO `tfg`.`clientes` (`id`, `fichas_clinicas_id`, `personas_id`) VALUES ('4', '4', '4');
INSERT INTO `tfg`.`clientes` (`id`, `fichas_clinicas_id`, `personas_id`) VALUES ('5', '5', '5');
INSERT INTO `tfg`.`clientes` (`id`, `fichas_clinicas_id`, `personas_id`) VALUES ('6', '6', '6');

INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('1', 'Japonés en pierna.', DATE_ADD(current_timestamp(), INTERVAL -2 DAY), DATE_ADD(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), INTERVAL 5 HOUR), '2000', '7', '6', '4', '18', '1', '1');
INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('2', 'New School en rodilla.', DATE_ADD(current_timestamp(), INTERVAL -1 DAY), DATE_ADD(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), INTERVAL 5 HOUR), '6000', '9', '7', '4', '22', '1', '1');
INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('3', 'Maori en espalda.', current_timestamp(), DATE_ADD(current_timestamp(), INTERVAL 4 HOUR), '500', '7', '6', '4', '20', '1', '2');
INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('4', 'Realismo en pierna.', DATE_ADD(current_timestamp(), INTERVAL -1 DAY), DATE_ADD(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), INTERVAL 5 HOUR), '800', '7', '6', '4', '25', '2', '3');
INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('5', 'Trash Polka en muslo.', DATE_ADD(current_timestamp(), INTERVAL 1 HOUR), DATE_ADD(current_timestamp(), INTERVAL 4 HOUR), '1500', '9', '6', '4', '28', '2', '4');
INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('6', 'Lettering en antebrazo.', DATE_ADD(current_timestamp(), INTERVAL -1 HOUR), DATE_ADD(current_timestamp(), INTERVAL 5 HOUR), '1200', '9', '6', '4', '19', '3', '5');
INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('7', 'New School en rodilla.', DATE_ADD(current_timestamp(), INTERVAL 2 DAY), DATE_ADD(DATE_ADD(current_timestamp(), INTERVAL 2 DAY), INTERVAL 3 HOUR), '2500', '9', '6', '4', '22', '3', '6');
INSERT INTO `tfg`.`turnos` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `seña`, `personas_id_iniciado_por`, `categorias_id_estado`, `categorias_id_prioridad`, `categorias_id_tipo_tatuaje`, `tatuadores_id`, `clientes_id`) VALUES ('8', 'Old School en rodilla.', DATE_ADD(current_timestamp(), INTERVAL 3 DAY), DATE_ADD(DATE_ADD(current_timestamp(), INTERVAL 3 DAY), INTERVAL 5 HOUR), '6000', '9', '7', '4', '23', '3', '1');