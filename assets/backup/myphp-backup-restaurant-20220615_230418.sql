CREATE DATABASE IF NOT EXISTS `restaurant`;

USE `restaurant`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `atencion`;

CREATE TABLE `atencion` (
  `idatencion` int(11) NOT NULL AUTO_INCREMENT,
  `idmesa` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`idatencion`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `atencion` VALUES (5,6,"admin","Facturado"),
(6,1,"admin","Facturado"),
(7,3,"admin","Facturado"),
(8,5,"admin","Facturado"),
(9,1,"admin","Facturado"),
(10,1,"admin","Facturado"),
(11,1,"admin","Facturado"),
(12,4,"admin","Facturado"),
(13,4,"admin","Facturado"),
(14,5,"admin","Facturado"),
(15,4,"admin","Facturado"),
(16,3,"admin","Facturado"),
(17,2,"admin","Facturado");

DROP TRIGGER IF EXISTS `atencion_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `atencion_AFTER_INSERT` AFTER INSERT ON `atencion` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('atenciones','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idatencion)$$

DELIMITER ;



DROP TABLE IF EXISTS `auditoria`;

CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `valor_id` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=latin1;

INSERT INTO `auditoria` VALUES (151,"productos","INSERT","2022-05-12","20:08:57","root@localhost",76),
(152,"productos","INSERT","2022-05-12","20:09:35","root@localhost",77),
(153,"productos","INSERT","2022-05-12","20:09:50","root@localhost",78),
(154,"productos","INSERT","2022-05-12","20:10:32","root@localhost",79),
(155,"productos","INSERT","2022-05-12","20:10:54","root@localhost",80),
(156,"productos","UPDATE","2022-05-12","20:11:23","root@localhost",75),
(157,"productos","INSERT","2022-05-12","20:11:52","root@localhost",81),
(158,"productos","UPDATE","2022-05-12","20:12:01","root@localhost",81),
(159,"productos","UPDATE","2022-05-12","20:13:12","root@localhost",11),
(160,"productos","UPDATE","2022-05-12","20:13:29","root@localhost",74),
(161,"productos","UPDATE","2022-05-12","20:13:45","root@localhost",73),
(162,"productos","UPDATE","2022-05-12","20:16:58","root@localhost",23),
(163,"productos","UPDATE","2022-05-12","20:17:47","root@localhost",71),
(164,"productos","UPDATE","2022-05-12","20:18:09","root@localhost",44),
(165,"productos","UPDATE","2022-05-12","20:18:25","root@localhost",43),
(166,"productos","UPDATE","2022-05-12","20:19:39","root@localhost",19),
(167,"productos","UPDATE","2022-05-12","20:21:42","root@localhost",11),
(168,"productos","UPDATE","2022-05-12","20:22:30","root@localhost",11),
(169,"productos","UPDATE","2022-05-12","20:22:56","root@localhost",16),
(170,"productos","UPDATE","2022-05-12","20:24:14","root@localhost",50),
(171,"productos","INSERT","2022-05-12","20:27:48","root@localhost",82),
(172,"productos","INSERT","2022-05-12","20:28:00","root@localhost",83),
(173,"productos","INSERT","2022-05-12","20:28:15","root@localhost",84),
(174,"productos","INSERT","2022-05-12","20:28:49","root@localhost",85),
(175,"productos","INSERT","2022-05-12","20:30:02","root@localhost",86),
(176,"productos","INSERT","2022-05-12","20:30:22","root@localhost",87),
(177,"categorias","INSERT","2022-05-12","21:01:15","root@localhost",28),
(178,"categorias","UPDATE","2022-05-12","21:01:48","root@localhost",23),
(179,"productos","UPDATE","2022-05-12","21:05:06","root@localhost",13),
(180,"productos","UPDATE","2022-05-12","21:06:26","root@localhost",12),
(181,"productos","UPDATE","2022-05-12","21:06:56","root@localhost",14),
(182,"productos","UPDATE","2022-05-12","21:07:19","root@localhost",21),
(183,"productos","UPDATE","2022-05-12","21:09:24","root@localhost",20),
(184,"categorias","UPDATE","2022-05-12","21:10:17","root@localhost",13),
(185,"categorias","INSERT","2022-05-12","21:10:38","root@localhost",29),
(186,"productos","INSERT","2022-05-12","21:11:28","root@localhost",88),
(187,"productos","INSERT","2022-05-12","21:11:54","root@localhost",89),
(188,"productos","INSERT","2022-05-12","21:14:57","root@localhost",90),
(189,"productos","UPDATE","2022-05-12","21:15:51","root@localhost",90),
(190,"productos","UPDATE","2022-05-12","21:16:49","root@localhost",78),
(191,"productos","UPDATE","2022-05-12","21:17:09","root@localhost",81),
(192,"productos","UPDATE","2022-05-12","21:17:37","root@localhost",54),
(193,"productos","INSERT","2022-05-12","21:18:51","root@localhost",91),
(194,"productos","INSERT","2022-05-12","21:20:53","root@localhost",92),
(195,"productos","UPDATE","2022-05-12","21:22:13","root@localhost",87),
(196,"productos","INSERT","2022-05-12","21:24:05","root@localhost",93),
(197,"productos","INSERT","2022-05-12","21:24:22","root@localhost",94),
(198,"productos","INSERT","2022-05-12","21:24:23","root@localhost",95),
(199,"productos","UPDATE","2022-05-12","21:25:28","root@localhost",95),
(200,"productos","INSERT","2022-05-12","21:27:23","root@localhost",96),
(201,"productos","INSERT","2022-05-12","21:29:53","root@localhost",97),
(202,"productos","INSERT","2022-05-12","21:30:11","root@localhost",98),
(203,"productos","INSERT","2022-05-12","21:30:31","root@localhost",99),
(204,"productos","INSERT","2022-05-12","21:30:59","root@localhost",100),
(205,"productos","INSERT","2022-05-12","21:31:57","root@localhost",101),
(206,"productos","INSERT","2022-05-12","21:32:19","root@localhost",102),
(207,"productos","INSERT","2022-05-12","21:34:36","root@localhost",103),
(208,"productos","INSERT","2022-05-12","21:35:08","root@localhost",104),
(209,"productos","INSERT","2022-05-12","21:35:41","root@localhost",105),
(210,"productos","INSERT","2022-05-12","21:36:19","root@localhost",106),
(211,"productos","INSERT","2022-05-12","21:36:49","root@localhost",107),
(212,"productos","INSERT","2022-05-12","21:37:05","root@localhost",108),
(213,"productos","INSERT","2022-05-12","21:38:15","root@localhost",109),
(214,"productos","UPDATE","2022-05-12","21:42:26","root@localhost",53),
(215,"productos","UPDATE","2022-05-12","21:43:18","root@localhost",103),
(216,"productos","UPDATE","2022-05-12","21:45:20","root@localhost",102),
(217,"productos","INSERT","2022-05-12","21:46:01","root@localhost",110),
(218,"productos","INSERT","2022-05-12","21:46:32","root@localhost",111),
(219,"productos","INSERT","2022-05-12","21:47:38","root@localhost",112),
(220,"productos","INSERT","2022-05-12","21:50:09","root@localhost",113),
(221,"productos","UPDATE","2022-05-12","21:51:32","root@localhost",102),
(222,"productos","INSERT","2022-05-12","21:51:56","root@localhost",114),
(223,"productos","INSERT","2022-05-12","21:52:41","root@localhost",115),
(224,"productos","INSERT","2022-05-12","21:53:19","root@localhost",116),
(225,"productos","INSERT","2022-05-12","21:53:44","root@localhost",117),
(226,"productos","INSERT","2022-05-12","21:55:24","root@localhost",118),
(227,"productos","INSERT","2022-05-12","21:55:57","root@localhost",119),
(228,"productos","INSERT","2022-05-12","21:56:18","root@localhost",120),
(229,"productos","INSERT","2022-05-12","21:56:50","root@localhost",121),
(230,"productos","INSERT","2022-05-12","21:57:06","root@localhost",122),
(231,"productos","INSERT","2022-05-12","21:57:44","root@localhost",123),
(232,"productos","INSERT","2022-05-12","21:58:10","root@localhost",124),
(233,"productos","INSERT","2022-05-12","21:58:36","root@localhost",125),
(234,"productos","INSERT","2022-05-12","21:59:21","root@localhost",126),
(235,"productos","UPDATE","2022-05-12","22:00:10","root@localhost",122),
(236,"productos","UPDATE","2022-05-12","22:00:38","root@localhost",126),
(237,"productos","INSERT","2022-05-12","22:02:02","root@localhost",127),
(238,"productos","INSERT","2022-05-12","22:03:03","root@localhost",128),
(239,"productos","INSERT","2022-05-12","22:03:37","root@localhost",129),
(240,"productos","INSERT","2022-05-12","22:04:18","root@localhost",130),
(241,"productos","INSERT","2022-05-12","22:04:42","root@localhost",131),
(242,"productos","INSERT","2022-05-12","22:05:37","root@localhost",132),
(243,"productos","INSERT","2022-05-12","22:06:45","root@localhost",133),
(244,"productos","UPDATE","2022-05-12","22:07:10","root@localhost",133),
(245,"productos","INSERT","2022-05-12","22:08:45","root@localhost",134),
(246,"productos","INSERT","2022-05-12","22:09:07","root@localhost",135),
(247,"productos","UPDATE","2022-05-12","22:09:55","root@localhost",13),
(248,"productos","INSERT","2022-05-12","22:10:16","root@localhost",136),
(249,"productos","UPDATE","2022-05-12","22:10:50","root@localhost",136),
(250,"productos","UPDATE","2022-05-12","22:11:12","root@localhost",136),
(251,"productos","UPDATE","2022-05-12","22:11:36","root@localhost",136),
(252,"productos","INSERT","2022-05-12","22:12:39","root@localhost",137),
(253,"productos","INSERT","2022-05-12","22:13:06","root@localhost",138),
(254,"productos","INSERT","2022-05-12","22:13:43","root@localhost",139),
(255,"productos","INSERT","2022-05-12","22:13:58","root@localhost",140),
(256,"productos","INSERT","2022-05-12","22:14:33","root@localhost",141),
(257,"productos","INSERT","2022-05-12","22:15:24","root@localhost",142),
(258,"productos","INSERT","2022-05-12","22:16:28","root@localhost",143),
(259,"productos","INSERT","2022-05-12","22:17:16","root@localhost",144),
(260,"productos","INSERT","2022-05-12","22:18:31","root@localhost",145),
(261,"productos","INSERT","2022-05-12","22:20:14","root@localhost",146),
(262,"productos","INSERT","2022-05-12","22:20:40","root@localhost",147),
(263,"productos","INSERT","2022-05-12","22:21:04","root@localhost",148),
(264,"productos","INSERT","2022-05-12","22:21:42","root@localhost",149),
(265,"productos","INSERT","2022-05-12","22:22:04","root@localhost",150),
(266,"productos","INSERT","2022-05-12","22:22:29","root@localhost",151),
(267,"productos","INSERT","2022-05-12","22:22:58","root@localhost",152),
(268,"productos","INSERT","2022-05-12","22:23:31","root@localhost",153),
(269,"productos","INSERT","2022-05-12","22:25:07","root@localhost",154),
(270,"productos","INSERT","2022-05-12","22:25:29","root@localhost",155),
(271,"productos","INSERT","2022-05-12","22:26:03","root@localhost",156),
(272,"productos","INSERT","2022-05-12","22:27:54","root@localhost",157),
(273,"productos","INSERT","2022-05-12","22:28:33","root@localhost",158),
(274,"productos","INSERT","2022-05-12","22:28:52","root@localhost",159),
(275,"productos","INSERT","2022-05-12","22:29:19","root@localhost",160),
(276,"productos","INSERT","2022-05-12","22:29:52","root@localhost",161),
(277,"productos","UPDATE","2022-05-15","18:19:46","root@localhost",53),
(278,"productos","UPDATE","2022-05-15","18:24:10","root@localhost",53),
(279,"productos","UPDATE","2022-05-15","18:25:21","root@localhost",11),
(280,"productos","UPDATE","2022-05-15","18:25:27","root@localhost",12),
(281,"productos","UPDATE","2022-05-15","18:25:44","root@localhost",13),
(282,"productos","UPDATE","2022-05-15","18:25:52","root@localhost",14),
(283,"productos","UPDATE","2022-05-15","18:26:00","root@localhost",15),
(284,"productos","UPDATE","2022-05-15","18:26:13","root@localhost",16),
(285,"productos","UPDATE","2022-05-15","18:28:38","root@localhost",18),
(286,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",19),
(287,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",20),
(288,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",21),
(289,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",23),
(290,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",40),
(291,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",41),
(292,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",42),
(293,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",43),
(294,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",44),
(295,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",45),
(296,"productos","UPDATE","2022-05-15","18:28:39","root@localhost",46),
(297,"productos","UPDATE","2022-05-15","18:28:40","root@localhost",47),
(298,"productos","UPDATE","2022-05-15","18:28:40","root@localhost",48),
(299,"productos","UPDATE","2022-05-15","18:28:40","root@localhost",49),
(300,"productos","UPDATE","2022-05-15","18:28:40","root@localhost",50),
(301,"productos","UPDATE","2022-05-15","18:28:40","root@localhost",51),
(302,"productos","UPDATE","2022-05-15","18:28:40","root@localhost",54),
(303,"productos","UPDATE","2022-05-15","18:40:07","root@localhost",133),
(304,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",134),
(305,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",135),
(306,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",136),
(307,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",137),
(308,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",138),
(309,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",139),
(310,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",140),
(311,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",141),
(312,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",142),
(313,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",143),
(314,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",144),
(315,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",145),
(316,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",146),
(317,"productos","UPDATE","2022-05-15","18:40:08","root@localhost",147),
(318,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",148),
(319,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",149),
(320,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",150),
(321,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",151),
(322,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",152),
(323,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",153),
(324,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",154),
(325,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",155),
(326,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",156),
(327,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",157),
(328,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",158),
(329,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",159),
(330,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",160),
(331,"productos","UPDATE","2022-05-15","18:40:09","root@localhost",161),
(332,"productos","UPDATE","2022-05-15","19:11:56","root@localhost",55),
(333,"productos","UPDATE","2022-05-15","19:11:56","root@localhost",56),
(334,"productos","UPDATE","2022-05-15","19:11:56","root@localhost",57),
(335,"productos","UPDATE","2022-05-15","19:11:56","root@localhost",59),
(336,"productos","UPDATE","2022-05-15","19:11:56","root@localhost",60),
(338,"productos","UPDATE","2022-05-15","19:13:49","root@localhost",61),
(339,"productos","UPDATE","2022-05-15","19:14:03","root@localhost",63),
(340,"productos","UPDATE","2022-05-15","19:14:08","root@localhost",64),
(341,"productos","UPDATE","2022-05-15","19:14:13","root@localhost",65),
(342,"productos","UPDATE","2022-05-15","19:14:17","root@localhost",67),
(343,"productos","UPDATE","2022-05-15","19:14:22","root@localhost",68),
(344,"productos","UPDATE","2022-05-15","19:14:27","root@localhost",69),
(345,"productos","UPDATE","2022-05-15","19:14:38","root@localhost",70),
(346,"productos","UPDATE","2022-05-15","19:14:59","root@localhost",71),
(347,"productos","UPDATE","2022-05-15","19:15:08","root@localhost",72),
(348,"productos","UPDATE","2022-05-15","19:15:51","root@localhost",73),
(349,"productos","UPDATE","2022-05-15","19:15:57","root@localhost",74),
(350,"productos","UPDATE","2022-05-15","19:16:02","root@localhost",75),
(351,"productos","UPDATE","2022-05-15","19:16:07","root@localhost",76),
(352,"productos","UPDATE","2022-05-15","19:16:11","root@localhost",77),
(353,"productos","UPDATE","2022-05-15","19:16:26","root@localhost",78),
(354,"productos","UPDATE","2022-05-15","19:16:31","root@localhost",79),
(355,"productos","UPDATE","2022-05-15","19:16:36","root@localhost",80),
(356,"productos","UPDATE","2022-05-15","19:16:41","root@localhost",81),
(357,"productos","UPDATE","2022-05-15","19:16:45","root@localhost",82),
(358,"productos","UPDATE","2022-05-15","19:17:09","root@localhost",83),
(359,"productos","UPDATE","2022-05-15","19:17:17","root@localhost",84),
(360,"productos","UPDATE","2022-05-15","19:17:22","root@localhost",85),
(361,"productos","UPDATE","2022-05-15","19:17:27","root@localhost",86),
(362,"productos","UPDATE","2022-05-15","19:17:31","root@localhost",87),
(363,"productos","UPDATE","2022-05-15","19:17:36","root@localhost",88),
(364,"productos","UPDATE","2022-05-15","19:17:42","root@localhost",89),
(365,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",11),
(366,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",47),
(367,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",59),
(368,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",74),
(369,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",76),
(370,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",79),
(371,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",80),
(372,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",87),
(373,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",88),
(374,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",89),
(375,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",90),
(376,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",91),
(377,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",92),
(378,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",93),
(379,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",94),
(380,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",95),
(381,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",96),
(382,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",97),
(383,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",98),
(384,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",99),
(385,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",100),
(386,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",101),
(387,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",102),
(388,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",103),
(389,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",104),
(390,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",105),
(391,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",106),
(392,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",107),
(393,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",108),
(394,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",109),
(395,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",110),
(396,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",111),
(397,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",112),
(398,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",113),
(399,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",114),
(400,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",115),
(401,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",116),
(402,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",117),
(403,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",118),
(404,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",119),
(405,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",120),
(406,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",121),
(407,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",122),
(408,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",123),
(409,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",124),
(410,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",125),
(411,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",126),
(412,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",127),
(413,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",128),
(414,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",129),
(415,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",130),
(416,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",131),
(417,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",132),
(418,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",133),
(419,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",134),
(420,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",135),
(421,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",136),
(422,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",137),
(423,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",138),
(424,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",139),
(425,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",140),
(426,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",141),
(427,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",142),
(428,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",143),
(429,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",144),
(430,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",145),
(431,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",147),
(432,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",157),
(433,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",158),
(434,"productos","UPDATE","2022-05-15","19:18:33","root@localhost",159),
(435,"ordenes","INSERT","2022-05-16","21:07:36","root@localhost",44),
(436,"ordenes","INSERT","2022-05-16","21:07:36","root@localhost",45),
(437,"ordenes","INSERT","2022-05-16","21:07:57","root@localhost",46),
(438,"ordenes","INSERT","2022-05-16","21:07:57","root@localhost",47),
(439,"atenciones","INSERT","2022-05-18","00:05:21","root@localhost",16),
(440,"ordenes","INSERT","2022-05-18","00:08:28","root@localhost",48),
(441,"ordenes","INSERT","2022-05-18","00:08:28","root@localhost",49),
(442,"atenciones","INSERT","2022-05-18","00:08:31","root@localhost",17);



DROP TABLE IF EXISTS `cargos`;

CREATE TABLE `cargos` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` char(128) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `cargos` VALUES (1,"mesonero",1),
(2,"cajero",1),
(3,"cocinero",1),
(4,"recepcionista",1);

DROP TRIGGER IF EXISTS `cargos_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `cargos_AFTER_INSERT` AFTER INSERT ON `cargos` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('cargos','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idcargo)$$

DELIMITER ;



DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecategoria` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `categorias` VALUES (8,"POSTRES ",1),
(9,"ENSALADAS",1),
(13,"CARNES",1),
(17,"BEBIDAS ",1),
(18,"PANES",1),
(19,"DESAYUNO",1),
(20,"PIZZAS",1),
(21,"ADICIONALES",1),
(24,"NAVIDAD",1),
(27,"TIPICOS TACHIRA",1),
(28,"CENA",1),
(29,"ALMUERZOS",1);

DROP TRIGGER IF EXISTS `categorias_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `categorias_AFTER_INSERT` AFTER INSERT ON `categorias` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('categorias','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idcategoria)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `categorias_BEFORE_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `categorias_BEFORE_UPDATE` BEFORE UPDATE ON `categorias` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('categorias','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idcategoria)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `categorias_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `categorias_AFTER_UPDATE` AFTER UPDATE ON `categorias` FOR EACH ROW INSERT INTO categorias_respaldo(idcategoria,nombrecategoria,fecha,hora) VALUES (old.idcategoria,old.nombrecategoria,CURRENT_DATE(),CURRENT_TIME())$$

DELIMITER ;



DROP TABLE IF EXISTS `categorias_respaldo`;

CREATE TABLE `categorias_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `nombrecategoria` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `categorias_respaldo` VALUES (1,9,"ENSALADAS","2022-11-21","20:48:50"),
(2,13,"CARNE","2022-11-21","20:48:27"),
(3,22,"NAVIDAD","2022-11-05","21:38:17"),
(4,23,"COMPOTAS DIETETICAS","2022-11-21","20:30:24"),
(5,24,"NAVIDAD","2022-11-06","02:39:48"),
(6,22,"NAVIDAD 2","2022-11-21","21:43:04"),
(7,24,"NAVIDAD","2022-11-21","22:36:00"),
(8,23,"COMPOTAS DIETETICAS","2022-11-21","22:43:36"),
(9,17,"BEBIDAS ","2022-11-21","22:43:47"),
(10,24,"NAVIDAD","2022-11-21","22:43:51"),
(11,24,"NAVIDAD","2022-11-21","22:43:58"),
(12,9,"ENSALADAS","2022-11-21","22:44:02"),
(13,13,"CARNE","2022-11-21","22:44:04"),
(14,17,"BEBIDAS ","2022-11-21","22:44:06"),
(15,23,"COMPOTAS DIETETICAS","2022-11-21","22:44:08"),
(16,19,"DESAYUNO","2022-11-22","00:14:55"),
(17,19,"DESAYUNO","2022-11-22","00:15:03"),
(18,25,"POSTRES DIET","2022-11-22","21:55:40"),
(19,26,"PASTELERIA DIET","2022-11-22","21:56:57"),
(20,13,"CARNE","2022-11-22","22:00:48"),
(21,13,"CARNE","2022-11-22","22:00:59"),
(22,23,"COMPOTAS DIETETICAS","2022-05-12","21:01:48"),
(23,13,"CARNE","2022-05-12","21:10:17");



DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_de_documento` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Numero_de_documento` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Nacionalidad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha_de_nacimiento` date DEFAULT NULL,
  `Sexo` varchar(1) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Telefono1` bigint(20) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `cliente` VALUES (1,1,25727258,"Venezolana","Perez Chacon","Karen Ninoska","1996-05-28","M","Tachira",NULL,NULL,NULL,1);

DROP TRIGGER IF EXISTS `cliente_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `cliente_AFTER_INSERT` AFTER INSERT ON `cliente` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('cliente','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.id_cliente)$$

DELIMITER ;



DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `ID_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_documento` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numero_de_documento` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nacionalidad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono1` bigint(20) DEFAULT NULL,
  `telefono2` bigint(20) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_empleado`),
  KEY `cargo` (`cargo`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `empleado` VALUES (2,1,25727258,"Venezolana","Perez Chacon","Karen Ninoska","1996-05-28","Palo Alto",0,0,2,1),
(3,"Cedula de Identidad",33243234,"Venezuela","El Escamoso","Pedro","0000-00-00","Silent Hill",54343323,0,1,1);

DROP TRIGGER IF EXISTS `empleado_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `empleado_AFTER_INSERT` AFTER INSERT ON `empleado` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('empleado','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.id_empleado)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `empleado_BEFORE_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `empleado_BEFORE_UPDATE` BEFORE UPDATE ON `empleado` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('empleado','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.id_empleado)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `empleado_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `empleado_AFTER_UPDATE` AFTER UPDATE ON `empleado` FOR EACH ROW INSERT INTO empleado_respaldo (ID_empleado, tipo_de_documento, numero_de_documento, nacionalidad, apellidos, nombres, fecha_de_nacimiento, direccion, telefono1, telefono2, cargo, fecha,hora) VALUES (old.ID_empleado, old.tipo_de_documento, old.numero_de_documento, old.nacionalidad, old.apellidos, old.nombres, old.fecha_de_nacimiento, old.direccion, old.telefono1, old.telefono2, old.cargo,CURRENT_DATE(),CURRENT_TIME())$$

DELIMITER ;



DROP TABLE IF EXISTS `empleado_respaldo`;

CREATE TABLE `empleado_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ID_empleado` int(11) NOT NULL,
  `tipo_de_documento` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numero_de_documento` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nacionalidad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono1` bigint(20) DEFAULT NULL,
  `telefono2` bigint(20) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `empleado_respaldo` VALUES (1,2,1,25727258,"Venezolana","Perez Chacon","Karen Ninoska","1996-05-28",NULL,NULL,NULL,2,"2022-11-05","21:49:46"),
(2,3,"Cedula de Identidad",33243234,"Venezuela","Escamoso","Pedro",NULL,"Silent Hill",54343323,0,1,"2022-11-06","02:44:00");



DROP TABLE IF EXISTS `mesas`;

CREATE TABLE `mesas` (
  `codmesa` int(11) NOT NULL AUTO_INCREMENT,
  `mesa` text COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codmesa`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `mesas` VALUES (1,"MESA 1",1),
(2,"MESA 2",1),
(3,"MESA 3",1),
(4,"MESA 4",1),
(5,"MESA 5",1),
(6,"MESA 6",1),
(7,"MESA 7",1),
(8,"MESA 8",1),
(9,"MESA 9",1),
(10,"MESA 10",1),
(13,"MESA 11",0),
(14,"MESA 11",0),
(15,"MESA 11A",0),
(16,"MESA 11",1);

DROP TRIGGER IF EXISTS `mesas_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `mesas_AFTER_INSERT` AFTER INSERT ON `mesas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('mesas','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.codmesa)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `mesas_BEFORE_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `mesas_BEFORE_UPDATE` BEFORE UPDATE ON `mesas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('mesas','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.codmesa)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `mesas_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `mesas_AFTER_UPDATE` AFTER UPDATE ON `mesas` FOR EACH ROW INSERT INTO mesas_respaldo (codmesa, mesa,fecha,hora) VALUES (old.codmesa, old.mesa,CURRENT_DATE(),CURRENT_TIME())$$

DELIMITER ;



DROP TABLE IF EXISTS `mesas_respaldo`;

CREATE TABLE `mesas_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codmesa` int(11) NOT NULL,
  `mesa` text COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;




DROP TABLE IF EXISTS `ordenes`;

CREATE TABLE `ordenes` (
  `idorden` int(11) NOT NULL AUTO_INCREMENT,
  `codmesa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `total` int(11) NOT NULL,
  `fecha` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `hora` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `dia` date NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `empleado` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `mesa` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `PDF` varchar(50) COLLATE utf8_spanish2_ci DEFAULT '0',
  `idatencion` int(11) DEFAULT '0',
  `estado` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idorden`),
  KEY `codmesa` (`codmesa`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`codmesa`) REFERENCES `mesas` (`codmesa`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `ordenes` VALUES (14,1,56,20,1,20,"Sabado, 14 de Noviembre de 2022","04:44 am","2022-11-14","admin","Prueba Prueba"," MESA 1",1,6,"Facturado"),
(15,5,56,20,1,20,"Sabado, 14 de Noviembre de 2022","04:46 am","2022-11-14","admin","Prueba Prueba"," MESA 5",1,7,"Facturado"),
(16,15,68,60,1,60,"Sabado, 14 de Noviembre de 2022","04:46 am","2022-11-14","admin","Prueba Prueba"," MESA 11",1,8,"Facturado"),
(17,8,56,20,1,20,"Sabado, 14 de Noviembre de 2022","04:53 am","2022-11-14","admin","Prueba Prueba"," MESA 8",1,9,"Facturado"),
(18,2,67,70,1,210,"Domingo, 15 de Mayo de 2022","10:53 pm","2022-11-14","admin","Karen Ninoska Perez Chacon"," MESA 2",1,17,"Eliminado"),
(19,6,14,43,1,43,"Sabado, 14 de Noviembre de 2022","04:56 am","2022-11-14","admin","Prueba Prueba"," MESA 6",1,5,"Facturado"),
(20,1,68,60,1,60,"Sabado, 14 de Noviembre de 2022","04:57 am","2022-11-14","admin","Prueba Prueba"," MESA 1",1,6,"Facturado"),
(21,3,67,70,1,70,"Sabado, 14 de Noviembre de 2022","04:57 am","2022-11-14","admin","Prueba Prueba"," MESA 3",1,7,"Facturado"),
(22,5,61,40,1,40,"Sabado, 14 de Noviembre de 2022","04:58 am","2022-11-14","admin","Prueba Prueba"," MESA 5",1,8,"Facturado"),
(28,1,11,10,1,10,"Viernes, 15 de Octubre de 2022","12:42 am","2022-10-15","admin","Karen Ninoska Perez Chacon"," MESA 1",1,11,"Facturado"),
(29,1,67,70,1,70,"Viernes, 15 de Octubre de 2022","12:42 am","2022-10-15","admin","Karen Ninoska Perez Chacon"," MESA 1",1,11,"Facturado"),
(30,3,53,5,3,15,"Domingo, 15 de Mayo de 2022","10:54 pm","2022-10-15","admin","Karen Ninoska Perez Chacon"," MESA 3",1,16,"Eliminado"),
(31,3,68,60,4,240,"Domingo, 15 de Mayo de 2022","10:54 pm","2022-10-15","admin","Karen Ninoska Perez Chacon"," MESA 3",1,16,"Eliminado"),
(32,4,57,9,2,18,"Viernes, 15 de Octubre de 2022","02:32 am","2022-10-15","admin","Karen Ninoska Perez Chacon"," MESA 4",1,12,"Facturado"),
(33,4,54,45,2,90,"Viernes, 15 de Octubre de 2022","02:32 am","2022-10-15","admin","Karen Ninoska Perez Chacon"," MESA 4",1,12,"Facturado"),
(34,4,15,29,1,29,"Viernes, 15 de Octubre de 2022","02:32 am","2022-10-15","admin","Karen Ninoska Perez Chacon"," MESA 4",1,12,"Eliminado"),
(35,4,11,10,2,20,"Sabado, 6 de Noviembre de 2022","03:40 am","2022-11-06","admin","Karen Ninoska Perez Chacon"," MESA 4",1,13,"Facturado"),
(36,4,72,55,1,55,"Sabado, 6 de Noviembre de 2022","03:40 am","2022-11-06","admin","Karen Ninoska Perez Chacon"," MESA 4",1,13,"Facturado"),
(37,4,15,29,1,29,"Sabado, 6 de Noviembre de 2022","03:40 am","2022-11-06","admin","Karen Ninoska Perez Chacon"," MESA 4",1,13,"Eliminado"),
(38,5,11,10,1,10,"Lunes, 22 de Noviembre de 2022","01:14 am","2022-11-22","admin","Karen Ninoska Perez Chacon"," MESA 5",1,14,"Facturado"),
(39,5,49,36,1,36,"Lunes, 22 de Noviembre de 2022","01:14 am","2022-11-22","admin","Karen Ninoska Perez Chacon"," MESA 5",1,14,"Facturado"),
(40,5,14,43,1,43,"Lunes, 22 de Noviembre de 2022","01:14 am","2022-11-22","admin","Karen Ninoska Perez Chacon"," MESA 5",1,14,"Facturado"),
(41,5,46,35,1,35,"Lunes, 22 de Noviembre de 2022","01:14 am","2022-11-22","admin","Karen Ninoska Perez Chacon"," MESA 5",1,14,"Facturado"),
(42,4,11,10,2,20,"Lunes, 22 de Noviembre de 2022","10:58 pm","2022-11-22","admin","Karen Ninoska Perez Chacon"," MESA 4",1,15,"Facturado"),
(43,4,49,36,1,36,"Lunes, 22 de Noviembre de 2022","10:57 pm","2022-11-22","admin","Karen Ninoska Perez Chacon"," MESA 4",1,15,"Eliminado"),
(44,3,57,9,2,18,"Lunes, 16 de Mayo de 2022","10:12 pm","2022-05-16","admin","Karen Ninoska Perez Chacon"," MESA 3",1,16,"Facturado"),
(45,3,143,10,4,40,"Lunes, 16 de Mayo de 2022","10:12 pm","2022-05-16","admin","Karen Ninoska Perez Chacon"," MESA 3",1,16,"Facturado"),
(46,1,72,55,2,110,"Lunes, 16 de Mayo de 2022","10:12 pm","2022-05-16","admin","Karen Ninoska Perez Chacon"," MESA 1",0,0,"Pendiente"),
(47,1,155,35,4,140,"Lunes, 16 de Mayo de 2022","10:12 pm","2022-05-16","admin","Karen Ninoska Perez Chacon"," MESA 1",0,0,"Pendiente"),
(48,2,57,9,2,18,"Miercoles, 18 de Mayo de 2022","01:08 am","2022-05-18","admin","Karen Ninoska Perez Chacon"," MESA 2",1,17,"Facturado"),
(49,2,14,43,1,43,"Miercoles, 18 de Mayo de 2022","01:08 am","2022-05-18","admin","Karen Ninoska Perez Chacon"," MESA 2",1,17,"Facturado");

DROP TRIGGER IF EXISTS `ordenes_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `ordenes_AFTER_INSERT` AFTER INSERT ON `ordenes` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('ordenes','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idorden)$$

DELIMITER ;



DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreproducto` text CHARACTER SET latin1 NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `precio` double NOT NULL,
  `precioUSD` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idproducto`),
  KEY `FK_productos_categorias` (`idcategoria`),
  KEY `FK_productos_usuarios` (`idusuario`),
  CONSTRAINT `FK_productos_categorias` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_productos_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `productos` VALUES (11,"SODA",17,10,3,18,1),
(12,"COCA COLA ",17,33,10,18,1),
(13,"VINO DE UVITA",17,128,40,18,1),
(14,"ENSALADA DE GALLINA",9,43,13,18,1),
(15,"ENSALADA MIXTA",9,29,9,1,1),
(16,"MANZANITA PERSONAL",17,17,5,18,1),
(18,"HELADOS 2 BOLAS",8,40,12,1,1),
(19,"CARNE GUISADA",13,57,18,18,1),
(20,"PONCHE CREMA",24,100,33,18,1),
(21,"QUESILLO",8,40,13,18,1),
(23,"PERNIL",13,130,43,18,1),
(40,"BANANA SPLIT",8,35,11,1,1),
(41,"MONDONGO MUTE",13,25,8,1,1),
(42,"PISCA ANDINA",19,25,8,1,1),
(43,"CHICHA ANDINA",17,35,11,18,1),
(44,"MASATO TACHIRENSE",17,40,13,1,0),
(45,"HELADO DE 3 BOLAS",8,30,9,1,1),
(46,"CALDO DE PAPAS",19,35,11,1,1),
(47,"MAZAMORRA",8,10,3,1,1),
(48,"HIGOS RELLENOS CON AREQUIPE",8,8,2,1,1),
(49,"ALIADOS",8,36,11,1,1),
(50,"TORTA DE AUYAMA",8,12,3,18,1),
(51,"PALEONIAS",8,36,11,1,1),
(53,"AGUA PANELA CON LIMON",17,5,2,18,1),
(54,"BISTECK A LA PLANCHA",29,45,13,18,1),
(55,"BABY BEEF",13,65,20,1,0),
(56,"QUESADILLA",18,20,6,1,1),
(57,"CAFE",17,9,2,1,1),
(59,"MICHE ANDINO",17,10,3,1,1),
(60,"CALENTADO ANDINO",17,5,1,1,1),
(61,"PIZZA HAWAIANA PEQUEÃ‘A",20,40,13,17,1),
(63,"JUGO DE NARANJA",17,22,7,1,1),
(64,"PIZZA TRES QUESOS PEQUEÑA",20,40,13,18,1),
(65,"PIZZA TRES QUESOS MEDIANA",20,55,14,1,1),
(67,"PIZZA HAWAIANA GRANDE",20,70,20,1,1),
(68,"PIZZA HAWAIANA MEDIANA",20,60,17,1,1),
(69,"PIZZA TRES QUESOS GRANDE",20,60,17,1,1),
(70,"PEPSI MANZANA",17,50,15,17,0),
(71,"GELATINA DE COLORES",8,40,12,18,1),
(72,"BANANA SUPER SPLIT",8,55,17,17,0),
(73,"CAFE CON LECHE",17,14,4,18,1),
(74,"CHICHA ANDINA",17,10,3,18,0),
(75,"PISCA ANDINA",27,35,10,18,0),
(76,"MASATO",17,10,3,18,1),
(77,"PASTEL DE YUCA",27,20,6,18,1),
(78,"PERICO",19,40,12,18,1),
(79,"MELCOCHAS",8,10,3,18,1),
(80,"COCADAS",8,10,3,18,1),
(81,"AGUAMIEL CON LECHE",17,7,2,18,1),
(82,"PAN DE MAIZ",18,5,1,18,1),
(83,"PAN DE AVENA",18,5,1,18,1),
(84,"PAN AZUCARADO",18,5,1,18,1),
(85,"HALLACAS ANDINAS",24,30,9,18,1),
(86,"BOLLITOS DE MAZORCA",27,15,4,18,1),
(87,"AREPAS RELLENAS",19,10,3,18,1),
(88,"PAPAS FRITAS",21,10,3,18,1),
(89,"YUCA FRITA",21,10,3,18,1),
(90,"CREMA DE AUYAMA",29,10,3,18,1),
(91,"SOPA MAIZ TIERNO",29,10,3,18,1),
(92,"CACHAPAS",28,10,3,18,1),
(93,"SANCOCHO TACHIRENSE ",13,10,3,18,1),
(94,"HERVIDO DE GALLINA",29,10,3,18,1),
(95,"CALDO CON LECHE",19,10,3,18,1),
(96,"ENSALADA VERDE ",9,10,3,18,1),
(97,"HUEVOS DE CORDONIZ COCIDOS",21,10,3,18,1),
(98,"PARRILLA",13,10,3,18,1),
(99,"COCHINO FRITO",29,10,3,18,1),
(100,"MAZORCAS A LA LEÑA CON MANTEQUILLA",21,10,3,18,1),
(101,"EMPANADAS",19,10,3,18,1),
(102,"CHURROS",19,10,3,18,1),
(103,"CARNE MECHADA",13,10,3,18,1),
(104,"PABELLON CRIOLLO",29,10,3,18,1),
(105,"TAJADAS CON QUESO Y MANTEQUILLA",28,10,3,18,1),
(106,"HIGADO ENCEBOLLADO",29,10,3,18,1),
(107,"PESCADO FRITO",13,10,3,18,1),
(108,"PESCADO GUISADO",13,10,3,18,1),
(109,"PAVO RELLENO",24,10,3,18,1),
(110,"CHORIZOS",13,10,3,18,1),
(111,"MORCILLAS ",21,10,3,18,1),
(112,"HALLACAS DOMINGUERAS",21,10,3,18,1),
(113,"PAN DE MANTEQUILLA",18,10,3,18,1),
(114,"MANDOCAS",27,10,3,18,1),
(115,"PASTELES",19,10,3,18,1),
(116,"DULCE DE LECHOZA",8,10,3,18,1),
(117,"DULCE DE LECHE",8,10,3,18,1),
(118,"HIGOS AL ALMIBAR",8,10,3,18,1),
(119,"DULCE DE CONCHA DE NARANJA",8,10,3,18,1),
(120,"NARANJAS RELLENAS ",8,10,3,18,1),
(121,"DULCE MANGO",8,10,3,18,1),
(122,"CONSERVA DE LECHOZA ",8,10,3,18,1),
(123,"MAMONES ",21,10,3,18,1),
(124,"DULCE DE GUAYABA",8,10,3,18,1),
(125,"ARROZ CON LECHE",28,10,3,18,1),
(126,"CONSERVA DE DURAZNO",8,10,3,18,1),
(127,"COQUITOS",8,10,3,18,1),
(128,"MERMELADA DE NARANJA",21,10,3,18,1),
(129,"MERMELADA DE FRESA",21,10,3,18,1),
(130,"MERMELADA DE PARCHITA",21,10,3,18,1),
(131,"JALEA DE PIÑA",21,10,3,18,1),
(132,"TORTA CHOCOLATE ",8,10,3,18,1),
(133,"BUÑUELOS",19,10,3,18,1),
(134,"GUARAPO DE CAÑA",17,10,3,18,1),
(135,"AGUARDIENTE",17,10,3,18,1),
(136,"VINO DE MORAS O DE FRESAS",17,10,3,18,1),
(137,"COCTELES DE FRUTAS",17,10,3,18,1),
(138,"TIZANA DE FRUTAS",8,10,3,18,1),
(139,"JUGO TRES SABORES",17,10,3,18,1),
(140,"BOMBA",19,10,3,18,1),
(141,"ATOL DE AVENA",19,10,3,18,1),
(142,"LECHE DE BURRA",17,10,3,18,1),
(143,"ENSALADA DE ATUN",9,10,3,18,1),
(144,"PAN DE JAMON",24,10,3,18,1),
(145,"INFUSIONES DE HIERBAS",17,10,3,18,1),
(146,"ASADO NEGRO",29,15,4,18,1),
(147,"CACHITOS",18,10,3,18,1),
(148,"PASTICHO",29,15,4,18,1),
(149,"GOLFEADOS",8,15,4,18,1),
(150,"CARAOTAS NEGRAS",21,15,4,18,1),
(151,"PATACONES O TOSTONES",29,35,11,18,1),
(152,"BIEN ME SABE",8,40,12,18,1),
(153,"BESITOS DE COCO",8,15,4,18,1),
(154,"ALBÓNDIGAS",29,35,11,18,1),
(155,"CASABE",18,35,11,18,1),
(156,"CARNE EN VARA",13,35,11,18,1),
(157,"SUSPIROS",8,10,3,18,1),
(158,"CHICHA DE ARROZ",8,10,3,18,1),
(159,"POLVOROSAS",8,10,3,18,1),
(160,"COCUY",17,55,17,18,1),
(161,"GUARAPITA",17,35,11,18,1);

DROP TRIGGER IF EXISTS `productos_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `productos_AFTER_INSERT` AFTER INSERT ON `productos` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('productos','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idproducto)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `productos_BEFORE_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `productos_BEFORE_UPDATE` BEFORE UPDATE ON `productos` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('productos','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idproducto)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `productos_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW INSERT INTO productos_respaldo (idproducto, nombreproducto, idcategoria, precio, precioUSD, idusuario, fecha,hora) VALUES (old.idproducto, old.nombreproducto, old.idcategoria, old.precio, old.precioUSD, old.idusuario, CURRENT_DATE(), CURRENT_TIME())$$

DELIMITER ;



DROP TABLE IF EXISTS `productos_respaldo`;

CREATE TABLE `productos_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) NOT NULL,
  `nombreproducto` text CHARACTER SET latin1 NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `precio` double NOT NULL,
  `precioUSD` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `productos_respaldo` VALUES (1,61,"PIZZA HAWAIANA PEQUENA",20,40,0,1,"2022-11-05","22:54:18"),
(2,55,"BABY BEEF",13,65,0,1,"2022-11-21","23:18:46"),
(3,72,"BANANA SUPER SPLIT",8,55,0,17,"2022-11-21","23:29:43"),
(4,72,"BANANA SUPER SPLIT",8,55,0,17,"2022-11-21","23:31:56"),
(5,72,"BANANA SUPER SPLIT",8,55,0,17,"2022-11-21","23:32:05"),
(6,64,"PIZZA TRES QUESOS PEQUEÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‹Å“A",20,40,0,1,"2022-05-12","20:00:57"),
(7,58,"PAN DE JAMON",22,32,0,1,"2022-05-12","20:01:12"),
(8,75,"PISCA ANDINA",27,35,0,18,"2022-05-12","20:11:23"),
(9,81,"AGUAMIEL CON LECHE",19,13,0,18,"2022-05-12","20:12:01"),
(10,11,"AGUA CON GAS",17,10,0,1,"2022-05-12","20:13:12"),
(11,74,"CHICHA ANDINA",17,10,0,18,"2022-05-12","20:13:29"),
(12,73,"CAFE LATTE ",17,44,0,18,"2022-05-12","20:13:45"),
(13,23,"COLITA DE CUADRIL",13,130,0,1,"2022-05-12","20:16:58"),
(14,71,"GELATINA GOLDEN",8,140,0,17,"2022-05-12","20:17:47"),
(15,44,"MASATO TACHIRENSE",17,40,0,1,"2022-05-12","20:18:09"),
(16,43,"CHCHA ANDINA",17,35,0,1,"2022-05-12","20:18:25"),
(17,19,"MILANESA CON FRITAS",13,117,0,1,"2022-05-12","20:19:39"),
(18,11,"SODA",17,10,0,18,"2022-05-12","20:21:42"),
(19,11,"SODA 1L",17,10,0,18,"2022-05-12","20:22:30"),
(20,16,"SODA 500 ML",17,17,0,1,"2022-05-12","20:22:56"),
(21,50,"TORTA DE MAZORCA",8,12,0,1,"2022-05-12","20:24:14"),
(22,13,"VINO LA CASONA MALBEC",17,128,0,1,"2022-05-12","21:05:06"),
(23,12,"COCA COLA 500ML",17,33,0,1,"2022-05-12","21:06:26"),
(24,14,"ENSALADA COCIDA DE GALLINA",9,43,0,1,"2022-05-12","21:06:56"),
(25,21,"FLAN",8,40,0,1,"2022-05-12","21:07:19"),
(26,20,"VINO VALDEROBLE TINTO",17,100,0,1,"2022-05-12","21:09:24"),
(27,90,"SOPA DE AUYAMA",29,10,0,18,"2022-05-12","21:15:51"),
(28,78,"PERICO",27,40,0,18,"2022-05-12","21:16:49"),
(29,81,"AGUAMIEL CON LECHE",19,7,0,18,"2022-05-12","21:17:09"),
(30,54,"BISTECK A LA PLANCHA",13,45,0,1,"2022-05-12","21:17:37"),
(31,87,"AREPAS DE MAIZ",19,10,0,18,"2022-05-12","21:22:13"),
(32,95,"HERVIDO DE GALLINA",29,10,0,18,"2022-05-12","21:25:28"),
(33,53,"AGUA PANELA",17,5,0,1,"2022-05-12","21:42:26"),
(34,103,"CARNE MECHADA",29,10,0,18,"2022-05-12","21:43:18"),
(35,102,"TEQUEÑO",19,10,0,18,"2022-05-12","21:45:20"),
(36,102,"TEQUEÑOS",19,10,0,18,"2022-05-12","21:51:32"),
(37,122,"DULCE DE LECHOZA ",8,10,0,18,"2022-05-12","22:00:10"),
(38,126,"DULCE DE DURAZNO",8,10,0,18,"2022-05-12","22:00:38"),
(39,133,"BUÑUELOS DE YUCA",19,10,0,18,"2022-05-12","22:07:10"),
(40,13,"VINO ARTESANAL",17,128,0,18,"2022-05-12","22:09:55"),
(41,136,"VINO DE MORAS Y FRESAS",17,10,0,18,"2022-05-12","22:10:50"),
(42,136,"VINO DE MORAS Y FRESAS",17,10,0,18,"2022-05-12","22:11:12"),
(43,136,"VINO DE MORAS O FRESAS",17,10,0,18,"2022-05-12","22:11:36"),
(44,53,"AGUA PANELA CON LIMON",17,5,0,18,"2022-05-15","18:19:46"),
(45,53,"AGUA PANELA CON LIMON",17,5,0,18,"2022-05-15","18:24:10"),
(46,11,"SODA",17,10,0,18,"2022-05-15","18:25:21"),
(47,12,"COCA COLA ",17,33,0,18,"2022-05-15","18:25:27"),
(48,13,"VINO DE UVITA",17,128,0,18,"2022-05-15","18:25:44"),
(49,14,"ENSALADA DE GALLINA",9,43,0,18,"2022-05-15","18:25:52"),
(50,15,"ENSALADA MIXTA",9,29,0,1,"2022-05-15","18:26:00"),
(51,16,"MANZANITA PERSONAL",17,17,0,18,"2022-05-15","18:26:13"),
(52,18,"HELADOS 2 BOLAS",8,40,0,1,"2022-05-15","18:28:38"),
(53,19,"CARNE GUISADA",13,57,0,18,"2022-05-15","18:28:39"),
(54,20,"PONCHE CREMA",24,100,0,18,"2022-05-15","18:28:39"),
(55,21,"QUESILLO",8,40,0,18,"2022-05-15","18:28:39"),
(56,23,"PERNIL",13,130,0,18,"2022-05-15","18:28:39"),
(57,40,"BANANA SPLIT",8,35,0,1,"2022-05-15","18:28:39"),
(58,41,"MONDONGO MUTE",13,25,0,1,"2022-05-15","18:28:39"),
(59,42,"PISCA ANDINA",19,25,0,1,"2022-05-15","18:28:39"),
(60,43,"CHICHA ANDINA",17,35,0,18,"2022-05-15","18:28:39"),
(61,44,"MASATO TACHIRENSE",17,40,0,1,"2022-05-15","18:28:39"),
(62,45,"HELADO DE 3 BOLAS",8,30,0,1,"2022-05-15","18:28:39"),
(63,46,"CALDO DE PAPAS",19,35,0,1,"2022-05-15","18:28:39"),
(64,47,"MAZAMORRA",8,10,0,1,"2022-05-15","18:28:40"),
(65,48,"HIGOS RELLENOS CON AREQUIPE",8,8,0,1,"2022-05-15","18:28:40"),
(66,49,"ALIADOS",8,36,0,1,"2022-05-15","18:28:40"),
(67,50,"TORTA DE AUYAMA",8,12,0,18,"2022-05-15","18:28:40"),
(68,51,"PALEONIAS",8,36,0,1,"2022-05-15","18:28:40"),
(69,54,"BISTECK A LA PLANCHA",29,45,0,18,"2022-05-15","18:28:40"),
(70,133,"BUÑUELOS",19,10,0,18,"2022-05-15","18:40:07"),
(71,134,"GUARAPO DE CAÑA",17,10,0,18,"2022-05-15","18:40:08"),
(72,135,"AGUARDIENTE",17,10,0,18,"2022-05-15","18:40:08"),
(73,136,"VINO DE MORAS O DE FRESAS",17,10,0,18,"2022-05-15","18:40:08"),
(74,137,"COCTELES DE FRUTAS",17,10,0,18,"2022-05-15","18:40:08"),
(75,138,"TIZANA DE FRUTAS",8,10,0,18,"2022-05-15","18:40:08"),
(76,139,"JUGO TRES SABORES",17,10,0,18,"2022-05-15","18:40:08"),
(77,140,"BOMBA",19,10,0,18,"2022-05-15","18:40:08"),
(78,141,"ATOL DE AVENA",19,10,0,18,"2022-05-15","18:40:08"),
(79,142,"LECHE DE BURRA",17,10,0,18,"2022-05-15","18:40:08"),
(80,143,"ENSALADA DE ATUN",9,10,0,18,"2022-05-15","18:40:08"),
(81,144,"PAN DE JAMON",24,10,0,18,"2022-05-15","18:40:08"),
(82,145,"INFUSIONES DE HIERBAS",17,10,0,18,"2022-05-15","18:40:08"),
(83,146,"ASADO NEGRO",29,15,0,18,"2022-05-15","18:40:08"),
(84,147,"CACHITOS",18,10,0,18,"2022-05-15","18:40:08"),
(85,148,"PASTICHO",29,15,0,18,"2022-05-15","18:40:09"),
(86,149,"GOLFEADOS",8,15,0,18,"2022-05-15","18:40:09"),
(87,150,"CARAOTAS NEGRAS",21,15,0,18,"2022-05-15","18:40:09"),
(88,151,"PATACONES O TOSTONES",29,35,0,18,"2022-05-15","18:40:09"),
(89,152,"BIEN ME SABE",8,40,0,18,"2022-05-15","18:40:09"),
(90,153,"BESITOS DE COCO",8,15,0,18,"2022-05-15","18:40:09"),
(91,154,"ALBÓNDIGAS",29,35,0,18,"2022-05-15","18:40:09"),
(92,155,"CASABE",18,35,0,18,"2022-05-15","18:40:09"),
(93,156,"CARNE EN VARA",13,35,0,18,"2022-05-15","18:40:09"),
(94,157,"SUSPIROS",8,10,0,18,"2022-05-15","18:40:09"),
(95,158,"CHICHA DE ARROZ",8,10,0,18,"2022-05-15","18:40:09"),
(96,159,"POLVOROSAS",8,10,0,18,"2022-05-15","18:40:09"),
(97,160,"COCUY",17,55,0,18,"2022-05-15","18:40:09"),
(98,161,"GUARAPITA",17,35,0,18,"2022-05-15","18:40:09"),
(99,55,"BABY BEEF",13,65,0,1,"2022-05-15","19:11:56"),
(100,56,"QUESADILLA",18,20,0,1,"2022-05-15","19:11:56"),
(101,57,"CAFE",17,9,0,1,"2022-05-15","19:11:56"),
(102,59,"MICHE ANDINO",17,10,0,1,"2022-05-15","19:11:56"),
(103,60,"CALENTADO ANDINO",17,5,0,1,"2022-05-15","19:11:56"),
(104,61,"PIZZA HAWAIANA PEQUEÃ‘A",20,40,0,17,"2022-05-15","19:13:49"),
(105,63,"JUGO DE NARANJA",17,22,0,1,"2022-05-15","19:14:03"),
(106,64,"PIZZA TRES QUESOS PEQUEÑA",20,40,0,18,"2022-05-15","19:14:08"),
(107,65,"PIZZA TRES QUESOS MEDIANA",20,55,0,1,"2022-05-15","19:14:13"),
(108,67,"PIZZA HAWAIANA GRANDE",20,70,0,1,"2022-05-15","19:14:17"),
(109,68,"PIZZA HAWAIANA MEDIANA",20,60,0,1,"2022-05-15","19:14:22"),
(110,69,"PIZZA TRES QUESOS GRANDE",20,60,0,1,"2022-05-15","19:14:27"),
(111,70,"PEPSI MANZANA",17,50,0,17,"2022-05-15","19:14:38"),
(112,71,"GELATINA DE COLORES",8,40,0,18,"2022-05-15","19:14:59"),
(113,72,"BANANA SUPER SPLIT",8,55,0,17,"2022-05-15","19:15:08"),
(114,73,"CAFE CON LECHE",17,14,0,18,"2022-05-15","19:15:51"),
(115,74,"CHICHA ANDINA",17,10,0,18,"2022-05-15","19:15:57"),
(116,75,"PISCA ANDINA",27,35,0,18,"2022-05-15","19:16:02"),
(117,76,"MASATO",17,10,0,18,"2022-05-15","19:16:07"),
(118,77,"PASTEL DE YUCA",27,20,0,18,"2022-05-15","19:16:11"),
(119,78,"PERICO",19,40,0,18,"2022-05-15","19:16:26"),
(120,79,"MELCOCHAS",8,10,0,18,"2022-05-15","19:16:31"),
(121,80,"COCADAS",8,10,0,18,"2022-05-15","19:16:36"),
(122,81,"AGUAMIEL CON LECHE",17,7,0,18,"2022-05-15","19:16:41"),
(123,82,"PAN DE MAIZ",18,5,0,18,"2022-05-15","19:16:45"),
(124,83,"PAN DE AVENA",18,5,0,18,"2022-05-15","19:17:09"),
(125,84,"PAN AZUCARADO",18,5,0,18,"2022-05-15","19:17:17"),
(126,85,"HALLACAS ANDINAS",24,30,0,18,"2022-05-15","19:17:22"),
(127,86,"BOLLITOS DE MAZORCA",27,15,0,18,"2022-05-15","19:17:27"),
(128,87,"AREPAS RELLENAS",19,10,0,18,"2022-05-15","19:17:31"),
(129,88,"PAPAS FRITAS",21,10,0,18,"2022-05-15","19:17:36"),
(130,89,"YUCA FRITA",21,10,0,18,"2022-05-15","19:17:42"),
(131,11,"SODA",17,10,3,18,"2022-05-15","19:18:33"),
(132,47,"MAZAMORRA",8,10,3,1,"2022-05-15","19:18:33"),
(133,59,"MICHE ANDINO",17,10,3,1,"2022-05-15","19:18:33"),
(134,74,"CHICHA ANDINA",17,10,3,18,"2022-05-15","19:18:33"),
(135,76,"MASATO",17,10,3,18,"2022-05-15","19:18:33"),
(136,79,"MELCOCHAS",8,10,3,18,"2022-05-15","19:18:33"),
(137,80,"COCADAS",8,10,3,18,"2022-05-15","19:18:33"),
(138,87,"AREPAS RELLENAS",19,10,3,18,"2022-05-15","19:18:33"),
(139,88,"PAPAS FRITAS",21,10,3,18,"2022-05-15","19:18:33"),
(140,89,"YUCA FRITA",21,10,3,18,"2022-05-15","19:18:33"),
(141,90,"CREMA DE AUYAMA",29,10,0,18,"2022-05-15","19:18:33"),
(142,91,"SOPA MAIZ TIERNO",29,10,0,18,"2022-05-15","19:18:33"),
(143,92,"CACHAPAS",28,10,0,18,"2022-05-15","19:18:33"),
(144,93,"SANCOCHO TACHIRENSE ",13,10,0,18,"2022-05-15","19:18:33"),
(145,94,"HERVIDO DE GALLINA",29,10,0,18,"2022-05-15","19:18:33"),
(146,95,"CALDO CON LECHE",19,10,0,18,"2022-05-15","19:18:33"),
(147,96,"ENSALADA VERDE ",9,10,0,18,"2022-05-15","19:18:33"),
(148,97,"HUEVOS DE CORDONIZ COCIDOS",21,10,0,18,"2022-05-15","19:18:33"),
(149,98,"PARRILLA",13,10,0,18,"2022-05-15","19:18:33"),
(150,99,"COCHINO FRITO",29,10,0,18,"2022-05-15","19:18:33"),
(151,100,"MAZORCAS A LA LEÑA CON MANTEQUILLA",21,10,0,18,"2022-05-15","19:18:33"),
(152,101,"EMPANADAS",19,10,0,18,"2022-05-15","19:18:33"),
(153,102,"CHURROS",19,10,0,18,"2022-05-15","19:18:33"),
(154,103,"CARNE MECHADA",13,10,0,18,"2022-05-15","19:18:33"),
(155,104,"PABELLON CRIOLLO",29,10,0,18,"2022-05-15","19:18:33"),
(156,105,"TAJADAS CON QUESO Y MANTEQUILLA",28,10,0,18,"2022-05-15","19:18:33"),
(157,106,"HIGADO ENCEBOLLADO",29,10,0,18,"2022-05-15","19:18:33"),
(158,107,"PESCADO FRITO",13,10,0,18,"2022-05-15","19:18:33"),
(159,108,"PESCADO GUISADO",13,10,0,18,"2022-05-15","19:18:33"),
(160,109,"PAVO RELLENO",24,10,0,18,"2022-05-15","19:18:33"),
(161,110,"CHORIZOS",13,10,0,18,"2022-05-15","19:18:33"),
(162,111,"MORCILLAS ",21,10,0,18,"2022-05-15","19:18:33"),
(163,112,"HALLACAS DOMINGUERAS",21,10,0,18,"2022-05-15","19:18:33"),
(164,113,"PAN DE MANTEQUILLA",18,10,0,18,"2022-05-15","19:18:33"),
(165,114,"MANDOCAS",27,10,0,18,"2022-05-15","19:18:33"),
(166,115,"PASTELES",19,10,0,18,"2022-05-15","19:18:33"),
(167,116,"DULCE DE LECHOZA",8,10,0,18,"2022-05-15","19:18:33"),
(168,117,"DULCE DE LECHE",8,10,0,18,"2022-05-15","19:18:33"),
(169,118,"HIGOS AL ALMIBAR",8,10,0,18,"2022-05-15","19:18:33"),
(170,119,"DULCE DE CONCHA DE NARANJA",8,10,0,18,"2022-05-15","19:18:33"),
(171,120,"NARANJAS RELLENAS ",8,10,0,18,"2022-05-15","19:18:33"),
(172,121,"DULCE MANGO",8,10,0,18,"2022-05-15","19:18:33"),
(173,122,"CONSERVA DE LECHOZA ",8,10,0,18,"2022-05-15","19:18:33"),
(174,123,"MAMONES ",21,10,0,18,"2022-05-15","19:18:33"),
(175,124,"DULCE DE GUAYABA",8,10,0,18,"2022-05-15","19:18:33"),
(176,125,"ARROZ CON LECHE",28,10,0,18,"2022-05-15","19:18:33"),
(177,126,"CONSERVA DE DURAZNO",8,10,0,18,"2022-05-15","19:18:33"),
(178,127,"COQUITOS",8,10,0,18,"2022-05-15","19:18:33"),
(179,128,"MERMELADA DE NARANJA",21,10,0,18,"2022-05-15","19:18:33"),
(180,129,"MERMELADA DE FRESA",21,10,0,18,"2022-05-15","19:18:33"),
(181,130,"MERMELADA DE PARCHITA",21,10,0,18,"2022-05-15","19:18:33"),
(182,131,"JALEA DE PIÑA",21,10,0,18,"2022-05-15","19:18:33"),
(183,132,"TORTA CHOCOLATE ",8,10,0,18,"2022-05-15","19:18:33"),
(184,133,"BUÑUELOS",19,10,3,18,"2022-05-15","19:18:33"),
(185,134,"GUARAPO DE CAÑA",17,10,3,18,"2022-05-15","19:18:33"),
(186,135,"AGUARDIENTE",17,10,3,18,"2022-05-15","19:18:33"),
(187,136,"VINO DE MORAS O DE FRESAS",17,10,3,18,"2022-05-15","19:18:33"),
(188,137,"COCTELES DE FRUTAS",17,10,3,18,"2022-05-15","19:18:33"),
(189,138,"TIZANA DE FRUTAS",8,10,3,18,"2022-05-15","19:18:33"),
(190,139,"JUGO TRES SABORES",17,10,3,18,"2022-05-15","19:18:33"),
(191,140,"BOMBA",19,10,3,18,"2022-05-15","19:18:33"),
(192,141,"ATOL DE AVENA",19,10,3,18,"2022-05-15","19:18:33"),
(193,142,"LECHE DE BURRA",17,10,3,18,"2022-05-15","19:18:33"),
(194,143,"ENSALADA DE ATUN",9,10,3,18,"2022-05-15","19:18:33"),
(195,144,"PAN DE JAMON",24,10,3,18,"2022-05-15","19:18:33"),
(196,145,"INFUSIONES DE HIERBAS",17,10,3,18,"2022-05-15","19:18:33"),
(197,147,"CACHITOS",18,10,3,18,"2022-05-15","19:18:33"),
(198,157,"SUSPIROS",8,10,3,18,"2022-05-15","19:18:33"),
(199,158,"CHICHA DE ARROZ",8,10,3,18,"2022-05-15","19:18:33"),
(200,159,"POLVOROSAS",8,10,3,18,"2022-05-15","19:18:33");



DROP TABLE IF EXISTS `reservas`;

CREATE TABLE `reservas` (
  `idreserva` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecliente` varchar(150) CHARACTER SET latin1 NOT NULL,
  `cantidadpersonas` varchar(150) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(150) CHARACTER SET latin1 NOT NULL,
  `diallegada` date NOT NULL,
  `horallegada` text CHARACTER SET latin1 NOT NULL,
  `observaciones` text CHARACTER SET latin1 NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idreserva`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `reservas` VALUES (3,"CARLOS ALVARES",12,12345678,"2022-11-24","21:00","MESA LIBRE",1),
(12,"BIANCA ANIDUZZI",2,4584463,"2022-10-16","22:00","Sin Restricciones",1),
(16,"MARCOS ALBA",13,23455677,"2022-11-25","20:45","VINO GRAN RESERVA\r\n",1),
(17,"BRUCE WAYNE",22,3414584463,"2022-11-24","21:30","SIN PAN",1),
(19,"BIANCA ANIDUZZI",14,153693019,"2022-11-28","22:00","MOZO JULIA\r\n",1),
(20,"Nando Oxenford",6,4147428622,"2022-10-18","10:30","Vista a la calle",1),
(21,"Nando Oxenford",5,4247396804,"2022-10-18","10:30","Sin Restricciones",0),
(22,"FDFDF",5,234233242,"2022-10-22","10:30","Sin Restricciones",0),
(23,"NANDO OXENFORD",11,1255,"2022-10-22","15:30","Sin Restricciones",1),
(24,"NANDO OXENFORD",11,1255,"2022-10-22","15:30","Sin Restricciones",1),
(25,"ZXCXC",5,21325,"2022-10-30","15:33","Sin Restricciones",0),
(26,"NANDO OXENFORD CAVA",3,4147425522,"2022-12-31","15:15","CON AIRE ACONDICIONADO",1),
(27,"PEDRO PETRO",6,423546,"2022-11-27","20:45","Sin Restricciones",0),
(28,"ELBER SIMPO",4,4160894325,"2022-10-30","16:20","Sin Restricciones",1),
(29,"BALBIN BALCUENO",2,276543434,"2022-10-30","17:30","Sin Restricciones",0),
(30,"PEDRO ESCAMOSO",8,234123123,"2022-11-18","13:40","BODA",0),
(31,"PEDRO ESCAMOSO",13,52342123,"2022-11-24","11:55","NO FUMADORES",0);

DROP TRIGGER IF EXISTS `reservas_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `reservas_AFTER_INSERT` AFTER INSERT ON `reservas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('reservas','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idreserva)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `reservas_BEFORE_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `reservas_BEFORE_UPDATE` BEFORE UPDATE ON `reservas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('reservas','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idreserva)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `reservas_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `reservas_AFTER_UPDATE` AFTER UPDATE ON `reservas` FOR EACH ROW INSERT INTO reservas_respaldo (idreserva,nombrecliente,cantidadpersonas, telefono, diallegada, horallegada, observaciones,fecha,hora) VALUES (old.idreserva,old.nombrecliente,old.cantidadpersonas,old.telefono, old.diallegada,old.horallegada,old.observaciones,CURRENT_DATE(), CURRENT_TIME())$$

DELIMITER ;



DROP TABLE IF EXISTS `reservas_respaldo`;

CREATE TABLE `reservas_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idreserva` int(11) NOT NULL,
  `nombrecliente` varchar(150) CHARACTER SET latin1 NOT NULL,
  `cantidadpersonas` varchar(150) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(150) CHARACTER SET latin1 NOT NULL,
  `diallegada` date NOT NULL,
  `horallegada` text CHARACTER SET latin1 NOT NULL,
  `observaciones` text CHARACTER SET latin1 NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `reservas_respaldo` VALUES (1,30,"PEDRO ESCAMOSO",8,234123123,"2022-11-18","13:40","CUMPLEAÃ‘OS","2022-11-06","02:38:30"),
(2,30,"PEDRO ESCAMOSO",8,234123123,"2022-11-18","13:40","BODA","2022-11-06","02:38:36"),
(3,3,"CARLOS ALVARES",12,12345678,"2022-11-24","21:00","LIBRE MESA","2022-11-05","22:08:48"),
(4,31,"PEDRO ESCAMOSO",13,52342123,"2022-11-24","11:55","Sin Restricciones","2022-11-22","21:54:00"),
(5,31,"PEDRO ESCAMOSO",13,52342123,"2022-11-24","11:55","NO FUMADORES","2022-11-22","21:54:09");



DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` char(128) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `rol` VALUES (1,"admin",1),
(2,"cajero",1),
(3,"mesonero",1),
(4,"prueba",1);

DROP TRIGGER IF EXISTS `rol_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `rol_AFTER_INSERT` AFTER INSERT ON `rol` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('rol','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idrol)$$

DELIMITER ;



DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreusuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `password` char(255) COLLATE utf8_spanish2_ci NOT NULL,
  `fechacreado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_usuario` int(11) NOT NULL DEFAULT '0',
  `ID_empleado` int(11) DEFAULT '0',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  KEY `tipo_usuario` (`tipo_usuario`),
  KEY `ID_empleado` (`ID_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `usuarios` VALUES (1,"admin","cefbd13986ef4b4c6d57e681da43f7abc076d4d6236df728c1b57519763edd305ee8d6d3c94d5d853dbdc36c1a3169c5e7c4d8bccbf48fb31a6e0eb7758a9f8f","2022-10-10 02:48:14",1,NULL,1),
(6,"kperez","b11a40f05459da396dc8bf609233ddc43267eeba29a5e3d97dd662875765dd0cb89e848ebf0c2b23f2ce932023fe0184077cf60fce1ff9830e911ea15532c590","2022-10-08 00:24:19",2,2,1),
(9,"prueba","288289cdd6edf145926f8a9d354c4b93547ac48660cbd7be38c58102c87a77b5927fde7a08de457a00e46a9b62e82c469a13a6fdd7448aacf9691cbfb5e5a294","2022-10-09 17:27:08",0,NULL,0),
(10,"prueba20","33bbaa39c080a8e2c0bd730e4cf5b02606a205d62991386da24b00321cec76aa471e6138fc036c79054772c7686d1ed6ceed95fb23a60f8a4bbe06346a2e782f","2022-10-09 23:38:27",3,NULL,1),
(11,"test","69b8982b4d0a0dab66aa92a2e4f8eb6f3f8f0b5f9d902a127df556a55426523b45596f6471e477f02f4061acb88af461b928aa468dd1aa5a3faaa663e4d60379","2022-10-09 23:39:19",0,NULL,0),
(12,"prueba3","4f87f273fecf84a4d95123ddced6b6b2cec229877f9a324ae164cf7e13ea29b579114ac2c1628161afa0c84fff87f6a35110c03762f4fe01de593e574352af66","2022-10-10 01:13:59",2,NULL,0),
(13,"prueba7","ea1f1e35836df122195c29a9311a080af509f5d921f0a74a26791205a25dd58b9a9b461be9b2d9e21fd708fd7dede1caca472ab7453c898588eeeb6b36257291","2022-10-25 23:56:19",0,NULL,0),
(15,"prueba 4","e5abaad3c8965486fee892f3d7d2b6022aca033151ed15b31af1cadb92c448060681a8c851babc74239d7c6a9c6cd710ae542fdf3299c8328de9a09b75100725","2022-10-26 01:01:16",0,1,0),
(16,"prueba7","ea1f1e35836df122195c29a9311a080af509f5d921f0a74a26791205a25dd58b9a9b461be9b2d9e21fd708fd7dede1caca472ab7453c898588eeeb6b36257291","2022-10-26 13:32:14",0,1,0),
(17,"Prueba","0ba7c1f753b174aa04d3aea086c8fd27a99fc16da1705bbde09c1cb3cba565c1a1cdb93afb06d7b147eb0203440a0bfcf2f943834a2bc3f41059a8fbd44dba92","2022-11-14 20:31:30",3,0,1),
(18,"pescamoso","d7b04ff5211f60d3a678ae5d31a49679531f5a2712a634b574a6e8a375c163f7303feacfcbf3c3356e285e33518c054a7db5eb507d57616dff21428b23a8f9ec","2022-11-06 02:44:29",3,3,1);

DROP TRIGGER IF EXISTS `usuarios_AFTER_INSERT`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `usuarios_AFTER_INSERT` AFTER INSERT ON `usuarios` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('usuarios','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idusuario)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `usuarios_BEFORE_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `usuarios_BEFORE_UPDATE` BEFORE UPDATE ON `usuarios` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('usuarios','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idusuario)$$

DELIMITER ;

DROP TRIGGER IF EXISTS `usuarios_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `usuarios_AFTER_UPDATE` AFTER UPDATE ON `usuarios` FOR EACH ROW INSERT INTO usuarios_respaldo (idusuario, nombreusuario, fechacreado, tipo_usuario, ID_empleado,fecha,hora) VALUES (old.idusuario, old.nombreusuario, old.fechacreado, old.tipo_usuario, old.ID_empleado,CURRENT_DATE(), CURRENT_TIME())$$

DELIMITER ;



DROP TABLE IF EXISTS `usuarios_respaldo`;

CREATE TABLE `usuarios_respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `nombreusuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `password` char(255) COLLATE utf8_spanish2_ci NOT NULL,
  `fechacreado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_usuario` int(11) NOT NULL DEFAULT '0',
  `ID_empleado` int(11) DEFAULT '0',
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `usuarios_respaldo` VALUES (1,10,"prueba20","","2021-10-09 23:38:27",4,NULL,"2022-11-06","01:51:33"),
(2,10,"prueba20","","2021-10-09 23:38:27",0,NULL,"2022-11-05","23:13:46"),
(3,15,"prueba 4","","2021-10-26 01:01:16",0,1,"2022-11-21","23:53:34"),
(4,10,"prueba20","","2021-10-09 23:38:27",3,NULL,"2022-11-21","23:53:38"),
(5,12,"prueba3","","2021-10-10 01:13:59",2,NULL,"2022-11-21","23:53:42"),
(6,13,"prueba7","","2021-10-25 23:56:19",0,NULL,"2022-11-21","23:53:44"),
(7,16,"prueba7","","2021-10-26 13:32:14",0,1,"2022-11-21","23:53:48"),
(8,10,"prueba20","","2021-10-09 23:38:27",3,NULL,"2022-11-22","00:12:43");



SET foreign_key_checks = 1;
