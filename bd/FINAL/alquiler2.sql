-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-11-2019 a las 06:20:24
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquiler2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiladora`
--

DROP TABLE IF EXISTS `alquiladora`;
CREATE TABLE IF NOT EXISTS `alquiladora` (
  `id_alquiladora` int(10) NOT NULL AUTO_INCREMENT,
  `capacidad_mesa` int(12) NOT NULL,
  `diseño` text NOT NULL,
  `modelo_silla` varchar(20) NOT NULL,
  `num_sillas` int(40) NOT NULL,
  `foto` varchar(250) NOT NULL,
  `precio` float NOT NULL,
  `forro` varchar(20) NOT NULL,
  `loza` varchar(20) NOT NULL,
  `cristaleria` varchar(20) NOT NULL,
  `mesero` int(50) NOT NULL,
  `comentario` varchar(256) DEFAULT NULL,
  `id_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_alquiladora`),
  KEY `id_cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiladora`
--

INSERT INTO `alquiladora` (`id_alquiladora`, `capacidad_mesa`, `diseño`, `modelo_silla`, `num_sillas`, `foto`, `precio`, `forro`, `loza`, `cristaleria`, `mesero`, `comentario`, `id_cuenta`) VALUES
(1, 12, '', 'Sillas de madera', 12, '', 3500, 'Sin forro', 'Ceramica', 'Cristal cortado', 24, 'Excelente servicio', 1),
(2, 20, '', 'Sillas de metal ', 20, '', 3000, 'Tela', 'Barro', 'Copas', 25, 'Calidad en los servicios', 2),
(3, 24, '', 'Silla Tiffany', 24, '', 4000, 'Textil color morado', 'Vajillas de vidrio', 'Vados de vidrio', 24, 'Calidad y comodidad ', 3),
(4, 8, '', 'Silla de madera', 8, '', 1500, 'Sin forro', 'Vajilla porcelana ', 'Vaso tequilero', 10, 'Excelente servicio', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `curp` varchar(20) NOT NULL,
  `rfc` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `cuenta_bancaria` bigint(20) NOT NULL,
  `login` varchar(20) NOT NULL,
  `pago_total` float NOT NULL,
  PRIMARY KEY (`curp`),
  KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`curp`, `rfc`, `nombre`, `paterno`, `materno`, `cuenta_bancaria`, `login`, `pago_total`) VALUES
('HYTR234567JUKLPG21', 'HYGT236541WE1', 'Brenda ', 'Torres', 'Martínez', 1234567123456789, 'HYTR234567JUKLPG21', 0),
('JKKK555555PPPPPP99', 'WWWW777777UU2', 'Roman', 'Bedolla', 'Gallegos', 123456789234567823, 'JKKK555555PPPPPP99', 0),
('PPPP888888PPPPPP88', 'FFFF888888FF8', 'Maria', 'Delgado', 'Delgado', 300300300300100100, 'PPPP888888PPPPPP88', 0),
('UUUU555555TTTTTT44', 'YUYU776767YY6', 'Uriel', 'Yael', 'Pérez', 400400400400444444, 'UUUU555555TTTTTT44', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comida`
--

DROP TABLE IF EXISTS `comida`;
CREATE TABLE IF NOT EXISTS `comida` (
  `id_comida` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fotos` varchar(250) NOT NULL,
  `precio` float NOT NULL,
  `comentario` varchar(256) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `tipo_comida` varchar(50) NOT NULL,
  PRIMARY KEY (`id_comida`),
  KEY `id_cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comida`
--

INSERT INTO `comida` (`id_comida`, `nombre`, `fotos`, `precio`, `comentario`, `id_cuenta`, `tipo_comida`) VALUES
(1, 'Mole estilo Oaxaca', '', 1000, 'Buena calidad', 7, 'mexicana'),
(2, 'Pozole estilo Aguascalientes', '', 1200, 'Platillos  de excelente calidad.', 7, 'mexicana'),
(3, 'Paella de mariscos', '', 900, 'Buen servicio', 8, 'Española'),
(4, 'Pollo a la parmesana', '', 450, 'Excelente servicio, buen sazon. ', 9, 'Italiana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_bancaria`
--

DROP TABLE IF EXISTS `cuenta_bancaria`;
CREATE TABLE IF NOT EXISTS `cuenta_bancaria` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_bancaria` bigint(16) NOT NULL,
  `nombre_proveedor` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tipo` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuenta_bancaria`
--

INSERT INTO `cuenta_bancaria` (`id_cuenta`, `cuenta_bancaria`, `nombre_proveedor`, `tipo`) VALUES
(1, 1234567922345678, 'Servicio de comida vegana', 'Comida Vegana'),
(2, 3452367681212345, 'Acrofest', 'Salón'),
(3, 1234567948140544, 'Grupos musicales \"El poblanito\"', 'Grupo musical'),
(4, 7890000765420000, 'Decoración La flor de Atlixco', 'flores'),
(5, 5675670000234123, 'Universión', 'Payasos'),
(6, 3458902465791590, 'Alquiladora Los angeles ', 'alquiladora'),
(7, 3123000000123000, 'Servicio de comida mexicana', 'mexicana'),
(8, 4400440005454500, 'Servicio de comida española', 'Gastronomía española'),
(9, 1001212000220000, 'Italian food MX', 'Italiana con influencia cultural estadounidense'),
(10, 1234512345678907, 'Linda Vista', 'Salón'),
(11, 2345678901234564, 'Jardín Altamida.', 'Salón'),
(12, 7896540987651234, 'Los Girasoles.', 'Salón'),
(13, 6709125634891256, 'Picasso´s', 'Salón'),
(14, 9087689900223354, 'Puertagua', 'Salón'),
(15, 8889967003345612, 'Diamante Recepciones', 'Salón'),
(16, 3456227890330012, 'Matisse Recepciones', 'Salón'),
(17, 7778800991122345, 'Eventos Sociales Tag', 'Salón'),
(18, 6655432100009876, 'Recepciones Option', 'Salón'),
(19, 2345998876501234, 'Antares Recepciones', 'Salón'),
(20, 5556748901234500, 'Eventos sociales Aladino´s', 'Salón'),
(21, 7650981235184038, 'Tres Marías', 'Salón'),
(22, 3819349671039642, 'Las Bodegas del Galeón', 'Salón'),
(23, 6910432975019394, 'Acrópolis', 'Salón'),
(24, 3097688123610482, 'Villa Bam Bam', 'Salón'),
(25, 5678901234675891, 'Xcandra', 'Salón'),
(26, 5109348912765432, 'Posada Señorial', 'Salón'),
(27, 7654309812678902, 'Jani', 'Salón'),
(28, 4906754129076539, 'Terraza y Villa Bonanza', 'Salón'),
(29, 8903457651290345, 'Hotel Real de Naturales', 'Salón'),
(30, 9872356781209566, 'Party Time Eventos', 'Salón'),
(31, 5690237640891254, 'Jardín Manantiales', 'Salón'),
(32, 7651209734512890, 'RS Emporio', 'Salón'),
(33, 7894081789510296, 'Presidente InterContinental', 'Salón'),
(34, 9034768999112306, 'Bonsai', 'Salón'),
(35, 9023678955000289, 'Klasse', 'Salón'),
(36, 2340958180004369, 'Recepciones Elegance', 'Salón'),
(37, 3568901234567890, 'Jardín los Tulipanes', 'Salón'),
(38, 8934001278954002, 'El Quintal', 'Salón'),
(39, 6689071230007589, 'Sin protocolo', 'Salón'),
(40, 9834801859203004, 'Ardizana-Grupo Santa Rosa', 'Salón'),
(41, 2345118906678901, 'Recepciones Mará Isabel', 'Salón'),
(42, 1234671298754612, 'El olivo', 'Salón'),
(43, 8742000417392705, 'Las Brisas', 'Salón'),
(44, 1749295031458900, 'Jardín El Sol', 'Salón'),
(45, 1027592530854179, 'Presidente InterContinental', 'Salón'),
(46, 6189530286491061, 'Monaco', 'Salón'),
(47, 1039641096481204, 'Alfredo Recepciones', 'Salón'),
(48, 9274917048295013, 'Los Pavorreales', 'Salón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicio`
--

DROP TABLE IF EXISTS `detalle_servicio`;
CREATE TABLE IF NOT EXISTS `detalle_servicio` (
  `id_detalle_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `id_servicio` int(11) NOT NULL,
  `id_staff` int(11) NOT NULL,
  `id_alquiladora` int(11) NOT NULL,
  `id_comida` int(11) NOT NULL,
  `id_entretenimiento` int(11) NOT NULL,
  `id_floreria` int(11) NOT NULL,
  `id_musica` int(11) NOT NULL,
  `id_salon` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_servicio`),
  KEY `fk_detalle_servicio_servicio1_idx` (`id_servicio`),
  KEY `id_staff` (`id_staff`),
  KEY `id_comida` (`id_comida`),
  KEY `id_entretenimiento` (`id_entretenimiento`),
  KEY `id_floreria` (`id_floreria`),
  KEY `id_musica` (`id_musica`),
  KEY `id_salon` (`id_salon`),
  KEY `id_alquiladora` (`id_alquiladora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entretenimiento`
--

DROP TABLE IF EXISTS `entretenimiento`;
CREATE TABLE IF NOT EXISTS `entretenimiento` (
  `id_entretenimiento` int(100) NOT NULL AUTO_INCREMENT,
  `payasos` varchar(15) NOT NULL,
  `precio` float NOT NULL,
  `comentario` varchar(256) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_entretenimiento`),
  KEY `id_cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entretenimiento`
--

INSERT INTO `entretenimiento` (`id_entretenimiento`, `payasos`, `precio`, `comentario`, `id_cuenta`) VALUES
(1, 'Lagrimita', 1500, 'Diversas dinámicas para chicos y grandes, música en vivo,regalos para niños.  ', 5),
(2, 'Pepi y papa', 2000, 'Diversion en grande, show en vivo, dinamicas para ninos, chistes etc.', 5),
(3, 'Chuponcito. ', 2500, 'Sonrisas en cada momento, regalos, música en vivo.', 5),
(4, 'Los bombones', 1500, 'Buen servicio, excelente diversión.', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `floreria`
--

DROP TABLE IF EXISTS `floreria`;
CREATE TABLE IF NOT EXISTS `floreria` (
  `id_floreria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `fotos` varchar(250) NOT NULL,
  `precio` float NOT NULL,
  `comentario` varchar(256) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_floreria`),
  KEY `id_cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `floreria`
--

INSERT INTO `floreria` (`id_floreria`, `nombre`, `fotos`, `precio`, `comentario`, `id_cuenta`) VALUES
(1, 'Classic Rosas rojas', '', 640, 'Diseño de rosas en cajas de madera color negro, 12 rosas rojas.', 4),
(2, 'Lofty White-Rojas', '', 340, 'Diseño de rosas en cajas de madera color blanco,cinco rosas rosas.', 4),
(3, 'Arreglo de girasoles', '', 590, 'Jarrón de vidrio con 6, 8 o 10 girasoles grandes. ', 4),
(4, 'Canastas de mimbre', '', 1990, 'Mezcla de hojas de color verde cenizo y flores poco comunes como el anturio, heliconia o bromelia. ', 4),
(5, 'Ramillete de flores', '', 490, 'Flores como las margaritas o gerbenas sobre elementos como esferas, canastas o lámparas. ', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musica`
--

DROP TABLE IF EXISTS `musica`;
CREATE TABLE IF NOT EXISTS `musica` (
  `id_musica` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `comentario` varchar(256) DEFAULT NULL,
  `id_tipoMusica` int(11) DEFAULT NULL,
  `id_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_musica`),
  KEY `id_cuenta` (`id_cuenta`),
  KEY `id_tipoMusica` (`id_tipoMusica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `musica`
--

INSERT INTO `musica` (`id_musica`, `nombre`, `comentario`, `id_tipoMusica`, `id_cuenta`) VALUES
(1, 'Mariachi Pedregal', 'Música regional mexicana, diversos exitos.', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

DROP TABLE IF EXISTS `salon`;
CREATE TABLE IF NOT EXISTS `salon` (
  `id_salon` int(11) NOT NULL AUTO_INCREMENT,
  `capacidad` int(11) NOT NULL,
  `ubicacion` varchar(250) CHARACTER SET latin1 NOT NULL,
  `fotos` varchar(250) CHARACTER SET latin1 NOT NULL,
  `e-mail` varchar(250) CHARACTER SET latin1 NOT NULL,
  `precio` float NOT NULL,
  `nombre` varchar(250) CHARACTER SET latin1 NOT NULL,
  `comentario` varchar(256) CHARACTER SET latin1 NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_salon`),
  KEY `id_cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `salon`
--

INSERT INTO `salon` (`id_salon`, `capacidad`, `ubicacion`, `fotos`, `e-mail`, `precio`, `nombre`, `comentario`, `id_cuenta`) VALUES
(6, 500, 'Allende, 514 72760 San Pedro Cholula, Puebla.', 'a22d9-acrofest.jpg', 'Acrofest@hotmail.com', 5000, 'Acrofest', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 2),
(7, 1500, '27 Oriente, 610 72762 San Pedro Cholula, Puebla.', '99547-linda_vista.jpg', 'Linda_Vista@gmail.com', 6000, 'Linda Vista', 'Excelente ambiente.', 10),
(8, 250, 'Insurgentes, 13101 Col. Guadalupe Hidalgo 72490 Puebla, Puebla.', 'e076b-altamira.jpg', 'Jardin_Altamida@yahoo.com', 5000, 'Jardín Altamida', 'Excelente ilumicación,cuenta con áreas verdes.', 11),
(9, 1200, ' Av. 5 de Mayo, 1408 72810 Cholula, Puebla.', 'b2d1f-los_girasoles.jpg', 'Los_Girasoles@gmail.com', 6500, 'Los girasoles', 'Excelente ubicación, espacios amplios, buena iluminación. ', 12),
(10, 400, 'Prolongación 8 Norte,1814 Col. Ex hacienda Santa Teresa 72810 San Andrés Cholula, Puebla.', '293d1-picasso-s.jpg', 'Picasso\'s@yahoo.com', 3500, 'Picasso\'s', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 13),
(11, 1000, 'Camino a San Antonio Cacalotepec, 2520 Col Centro 72810 San Andrés Cholula, Puebla.', 'c240d-portagua.jpg', 'Puertagua@hotmail.com', 3500, 'Puertagua', 'Espacios amplios, excelente servicio.', 14),
(13, 140, 'Av. 21 Pte, 3506B. Col. Belisario Domínguez 72000 Puebla, Puebla.', '6ecfa-diamante_recepciones.jpg', 'Diamante_Recepciones@hotmail.com', 2500, 'Diamante Recepciones', 'Excelente ubicación, puntualidad en los eventos.', 15),
(14, 270, 'Prolongación de la calle 25 No. 92 Col. Concepción Las Lajas 72190 Puebla, Puebla.', '856bc-matisse_recepciones.jpg', 'Matisse_Recepciones@hotmail.com', 3800, 'Matisse Recepciones', 'Amplios espacios, áreas verdes, buena ubicación.', 16),
(15, 250, 'Calle 20 Sur, 505 Col. Azcarate 70501 Puebla, Puebla', 'b68a4-eventos_sociales_tag.jpg', 'Eventos_SocialesTag@gmail.com', 4600, 'Eventos Sociales Tag', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 17),
(16, 300, 'Av. 33 Oriente, 7 El Carmen-Huexotitla 72530 Puebla, Puebla.', '011eb-recepciones_option.jpg', 'Recepciones_Option@gmail.com', 2800, 'Recepciones Option', 'Excelente iluminación, amplios espacios verdes. ', 18),
(17, 350, 'Cristóbal Colón, 925, Col., Santa Cruz Buenavista 72150 Puebla, Puebla.', '2a0a1-antares_recepciones.jpg', 'Antares_Recepciones@gmail.com', 4200, 'Antares Recepciones', '', 19),
(18, 300, 'Avenida 57 Poniente 107, Zona Plaza Crystal 72440 Puebla, Puebla.', '5c679-eventos_sociales_aladinos.jpg', 'Eventos_sociales_Aladino´s@yahoo.com', 1800, 'Eventos sociales Aladino´s', 'Excelente zona de ubicación, amplios espacios, buena iluminación. ', 20),
(19, 800, 'Camino Real a Cholula, 666772100 Puebla, Puebla.', '19f26-tres_marias.jpg', 'Tres_Marías@gmail.com', 6300, 'Tres Marías', 'Espacios amplios, excelente música.  ', 21),
(20, 270, 'Blvd. Capitán Carlos Camacho Espíritu. 5979-A Col. Bugambilias 72550 Puebla, Puebla.', '135ce-bodegas_galeon.jpg', 'Las_Bodegas_del_Galeón@hotmail.com', 4300, 'Las Bodegas del Galeón', 'Amplios espacios, áreas verdes, buena ubicación.', 22),
(21, 155, 'Porfirio Díaz 31 Col. Vista Hermosa Álamos 72320 Puebla, Puebla.', '9a2bf-acropolis.jpg', 'Acrópolis', 1200, 'Acrópolis', 'Espacios amplios, excelente servicio.', 23),
(22, 200, 'Camino Real Los Cipreses, 1828 San Andrés Cholula 72810 Zaragoza, Puebla.', '09aa9-villa_bam_bam.jpg', 'Villa_Bam_Bam@gmail.com', 1900, 'Villa Bam Bam.', 'Excelente ubicación, puntualidad en los eventos.', 24),
(23, 180, '109 Oriente, 232 72474 Puebla, Puebla.', 'daf30-xcandra.jpg', 'Xcandra@yahoo.com', 2300, 'Xcandra', 'Excelente iluminación, amplios espacios verdes. ', 25),
(24, 1000, 'Avenida 5 de Mayo, 1400 72810 San Andrés Cholula, Puebla.', 'a68dd-posada_senorial.jpg', 'Posada_Señorial@hotmail.com', 7300, 'Posada Señorial', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 26),
(25, 200, 'Río Papagayo, 5 Col. Manantiales 72756 San Pedro Cholula, Puebla.', '431b0-jani.jpg', 'Jani@yahoo.com', 4200, 'Jani', 'Espacios amplios, excelente servicio.', 27),
(26, 200, 'Lago de Valsequillo, 26 72960 Puebla, Puebla.', '12406-terraza_billa_bonanza.jpg', 'Terraza_y_Villa_Bonanza', 2800, 'Terraza y Villa Bonanza', 'Excelente ubicación, buena iluminación y buen servicio.', 28),
(27, 250, '6 Oriente, 7 72760 San Pedro Cholula, Puebla.', 'cdb53-hotel-real_naturales.jpg', 'Hotel_Real_de_Naturales@gmail.com', 1700, 'Hotel Real de Naturales', 'Excelente ubicación, ética en los eventos.', 29),
(28, 120, 'Calle 7 Norte Col. Amor 72140 Puebla, Puebla.', 'c79df-party-time-eventos.jpg', 'Party_Time_Eventos@yahoo.com', 800, 'Party Time Eventos', 'Buen servicio, excelente ambiente. ', 30),
(29, 280, 'Av. Forjadores de Puebla, 902 Col. Manantiales 72760 Cholula, Puebla.', '897cc-manantiales.jpg', 'Jardín_Manantiales@hotmail.com', 1100, 'Jardín Manantiales', 'Servicio de calidad, cálido ambiente. ', 31),
(30, 400, 'Priv. 10 Oriente, 1209 72810 San Andrés Cholula, Puebla.', '876d6-rs-emporio.jpg', 'RS_Emporio@gmail.com', 1600, 'RS Emporio', 'Espacios amplios, excelente servicio.', 32),
(31, 500, 'Av. Hermanos Serdán, 141 72140 Puebla, Puebla.', '743ac-presidente-intercontinental.jpg', 'Presidente_InterContinental@gmail.com', 4100, 'Presidente InterContinental', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 33),
(32, 300, 'Av. 15 pte, 707 San Pedro Cholula 15020 Cholula, Puebla.', 'c109c-bonsai.jpg', 'Bonsai@yahoo.com', 2800, 'Bonsai', 'Espacios amplios, excelente servicio.', 34),
(33, 500, '25 Oriente, 1006 72020 Puebla, Puebla', 'efc02-kalsse.jpg', 'Klasse@yahoo.com', 6100, 'Klasse', 'Excelente ubicación, puntualidad en los eventos.', 35),
(34, 300, 'Carril de la Rosa, 5011 Col. 10 de Mayo 72270 Puebla, Puebla', '95169-recepciones_elegance.jpg', 'Recepciones Elegance@gmail.com', 8200, 'Recepciones Elegance.', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 36),
(35, 250, 'Tulipanes, 6144 Col. Bugambilias 72580 Puebla, Puebla.', '6da63-los_tulipanes.jpg', 'Jardín_los_Tulipanes@hotmail.com', 3500, 'Jardín los Tulipanes', 'Excelente ubicación, puntualidad en los eventos.', 37),
(36, 500, 'Diagonal San Diego, 809 Col. Los Sauces 72760 Cholula, Puebla.', '02bef-quintal.jpg', 'El_Quintal@yahoo.com', 9200, 'El Quintal', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 38),
(37, 160, 'Privada Oaxaca 4 Col, Independencia 72150 Puebla, Puebla.', '1b550-sin_protocolo.jpg', 'Sin_protocolo@gmail.com', 3400, 'Sin protocolo', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 39),
(38, 700, '33 Poniente 4319 Col. Nueva Antequera 72750 Puebla, Puebla.', '5391e-ardizana.jpg', 'Ardizana-Grupo_Santa_Rosa@gmail.com', 8400, 'Ardizana-Grupo Santa Rosa', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 40),
(39, 450, 'Zacapoaxtla, 33 Col. San Juan Chachapa 72990 Puebla, Puebla.', 'aba7c-recepciones_maria_isabel.jpg', 'Recepciones_Mará_Isabel@gmail.com', 7200, 'Recepciones Mará Isabel', 'Excelente iluminación, amplios espacios verdes. ', 41),
(40, 250, 'Camino a Morillotla 3038 Col. Ex Hacienda Morillotla 72815 San Andrés Cholula, Puebla.', 'b2dfa-el_olivo.jpg', 'El olivo@hotmail.com', 4800, 'El olivo', 'Amplios espacios, mayor comodidad, área de juegos infantiles. ', 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

DROP TABLE IF EXISTS `servicio`;
CREATE TABLE IF NOT EXISTS `servicio` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_servicio` date NOT NULL,
  `fecha_instalacion` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `hora` time DEFAULT NULL,
  `descripcion` varchar(250) NOT NULL,
  `curp` varchar(20) NOT NULL,
  `id_staff` int(11) DEFAULT NULL,
  `tipo_evento` varchar(20) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_servicio_cliente1_idx` (`curp`),
  KEY `fk_servicio_staff1_idx` (`id_staff`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `fecha_servicio`, `fecha_instalacion`, `fecha_entrega`, `hora`, `descripcion`, `curp`, `id_staff`, `tipo_evento`) VALUES
(9, '2019-11-06', '2019-11-07', '2019-11-08', '09:30:00', 'FCC fest', 'HYTR234567JUKLPG21', 2, 'Social'),
(10, '2019-11-01', '2019-11-05', '2019-11-06', '03:00:00', 'Festejo del día de compras', 'HYTR234567JUKLPG21', 3, 'Social'),
(11, '2019-11-11', '2019-11-13', '2019-11-15', '10:00:00', 'Cumpleaños de Roman', 'JKKK555555PPPPPP99', 3, 'Social'),
(12, '2019-11-25', '2019-11-26', '2019-11-27', '05:00:00', 'Festejo de aniversario COPPEL', 'PPPP888888PPPPPP88', 2, 'Corporativo'),
(13, '2019-11-11', '2019-11-12', '2019-11-13', '20:00:00', 'Cumpleaños de papá', 'JKKK555555PPPPPP99', NULL, 'Social');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `cuenta_bancaria` bigint(20) NOT NULL,
  PRIMARY KEY (`id_staff`),
  KEY `fk_staff_usuario1_idx` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `staff`
--

INSERT INTO `staff` (`id_staff`, `nombre`, `paterno`, `materno`, `login`, `cuenta_bancaria`) VALUES
(2, 'GUADALUPE', 'PEREZ', 'GARCIA', 'lupita', 0),
(3, 'Javier', 'Flores', 'Flores', 'javierFF17', 500500000999000009);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomusica`
--

DROP TABLE IF EXISTS `tipomusica`;
CREATE TABLE IF NOT EXISTS `tipomusica` (
  `id_tipoMusica` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `precio` float NOT NULL,
  `hora` int(10) NOT NULL,
  PRIMARY KEY (`id_tipoMusica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipomusica`
--

INSERT INTO `tipomusica` (`id_tipoMusica`, `nombre`, `precio`, `hora`) VALUES
(1, 'Mariachi', 5000, 2),
(2, 'DJ', 10000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nivel` varchar(20) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`login`, `password`, `nivel`) VALUES
('admin', 'admin', 'administrador'),
('brendaIM20', 'brendaIM20', 'administrador_evento'),
('guillermoST17', 'guillermoST17', 'administrador_evento'),
('HYTR234567JUKLPG21', '1Dmustr4', 'cliente'),
('javierFF17', 'javierFF17', 'administrador_evento'),
('JKKK555555PPPPPP99', 'Roman1212', 'cliente'),
('lupita', 'lupita', 'administrador_evento'),
('PPPP888888PPPPPP88', 'Maria122', 'cliente'),
('UUUU555555TTTTTT44', 'Uriel123', 'cliente');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiladora`
--
ALTER TABLE `alquiladora`
  ADD CONSTRAINT `alquiladora_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta_bancaria` (`id_cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`login`) REFERENCES `usuario` (`login`);

--
-- Filtros para la tabla `comida`
--
ALTER TABLE `comida`
  ADD CONSTRAINT `comida_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta_bancaria` (`id_cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD CONSTRAINT `detalle_servicio_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`),
  ADD CONSTRAINT `detalle_servicio_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`),
  ADD CONSTRAINT `detalle_servicio_ibfk_3` FOREIGN KEY (`id_comida`) REFERENCES `comida` (`id_comida`),
  ADD CONSTRAINT `detalle_servicio_ibfk_4` FOREIGN KEY (`id_entretenimiento`) REFERENCES `entretenimiento` (`id_entretenimiento`),
  ADD CONSTRAINT `detalle_servicio_ibfk_5` FOREIGN KEY (`id_floreria`) REFERENCES `floreria` (`id_floreria`),
  ADD CONSTRAINT `detalle_servicio_ibfk_6` FOREIGN KEY (`id_musica`) REFERENCES `musica` (`id_musica`),
  ADD CONSTRAINT `detalle_servicio_ibfk_8` FOREIGN KEY (`id_alquiladora`) REFERENCES `alquiladora` (`id_alquiladora`),
  ADD CONSTRAINT `detalle_servicio_ibfk_9` FOREIGN KEY (`id_salon`) REFERENCES `salon` (`id_salon`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_servicio_servicio1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_servicio_staff1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_staff` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`),
  ADD CONSTRAINT `id_staff_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE CASCADE;

--
-- Filtros para la tabla `entretenimiento`
--
ALTER TABLE `entretenimiento`
  ADD CONSTRAINT `entretenimiento_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta_bancaria` (`id_cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `floreria`
--
ALTER TABLE `floreria`
  ADD CONSTRAINT `floreria_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta_bancaria` (`id_cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `musica`
--
ALTER TABLE `musica`
  ADD CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`id_tipoMusica`) REFERENCES `tipomusica` (`id_tipoMusica`),
  ADD CONSTRAINT `musica_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta_bancaria` (`id_cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `salon`
--
ALTER TABLE `salon`
  ADD CONSTRAINT `salon_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta_bancaria` (`id_cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_servicio_staff1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`curp`) REFERENCES `cliente` (`curp`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`login`) REFERENCES `usuario` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
