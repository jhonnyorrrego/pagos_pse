-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2016 a las 02:36:47
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso2` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `iso3` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `phone_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `nombre`, `name`, `nom`, `iso2`, `iso3`, `phone_code`) VALUES
(1, 'Afganist&aacute;n', 'Afghanistan', '', 'AF', 'AFG', '93'),
(2, 'Albania', 'Albania', '', 'AL', 'ALB', '355'),
(3, 'Alemania', 'Germany', '', 'DE', 'DEU', '49'),
(4, 'Algeria', 'Algeria', '', 'DZ', 'DZA', '213'),
(5, 'Andorra', 'Andorra', '', 'AD', 'AND', '376'),
(6, 'Angola', 'Angola', '', 'AO', 'AGO', '244'),
(7, 'Anguila', 'Anguilla', '', 'AI', 'AIA', '1 264'),
(8, 'Ant&aacute;rtida', 'Antarctica', '', 'AQ', 'ATA', '672'),
(9, 'Antigua y Barbuda', 'Antigua and Barbuda', '', 'AG', 'ATG', '1 268'),
(10, 'Antillas Neerlandesas', 'Netherlands Antilles', '', 'AN', 'ANT', '599'),
(11, 'Arabia Saudita', 'Saudi Arabia', '', 'SA', 'SAU', '966'),
(12, 'Argentina', 'Argentina', '', 'AR', 'ARG', '54'),
(13, 'Armenia', 'Armenia', '', 'AM', 'ARM', '374'),
(14, 'Aruba', 'Aruba', '', 'AW', 'ABW', '297'),
(15, 'Australia', 'Australia', '', 'AU', 'AUS', '61'),
(16, 'Austria', 'Austria', '', 'AT', 'AUT', '43'),
(17, 'Azerbay&aacute;n', 'Azerbaijan', '', 'AZ', 'AZE', '994'),
(18, 'B&eacute;lgica', 'Belgium', '', 'BE', 'BEL', '32'),
(19, 'Bahamas', 'Bahamas', '', 'BS', 'BHS', '1 242'),
(20, 'Bahrein', 'Bahrain', '', 'BH', 'BHR', '973'),
(21, 'Bangladesh', 'Bangladesh', '', 'BD', 'BGD', '880'),
(22, 'Barbados', 'Barbados', '', 'BB', 'BRB', '1 246'),
(23, 'Belice', 'Belize', '', 'BZ', 'BLZ', '501'),
(24, 'Ben&iacute;n', 'Benin', '', 'BJ', 'BEN', '229'),
(25, 'Bhut&aacute;n', 'Bhutan', '', 'BT', 'BTN', '975'),
(26, 'Bielorrusia', 'Belarus', '', 'BY', 'BLR', '375'),
(27, 'Birmania', 'Myanmar', '', 'MM', 'MMR', '95'),
(28, 'Bolivia', 'Bolivia', '', 'BO', 'BOL', '591'),
(29, 'Bosnia y Herzegovina', 'Bosnia and Herzegovina', '', 'BA', 'BIH', '387'),
(30, 'Botsuana', 'Botswana', '', 'BW', 'BWA', '267'),
(31, 'Brasil', 'Brazil', '', 'BR', 'BRA', '55'),
(32, 'Brun&eacute;i', 'Brunei', '', 'BN', 'BRN', '673'),
(33, 'Bulgaria', 'Bulgaria', '', 'BG', 'BGR', '359'),
(34, 'Burkina Faso', 'Burkina Faso', '', 'BF', 'BFA', '226'),
(35, 'Burundi', 'Burundi', '', 'BI', 'BDI', '257'),
(36, 'Cabo Verde', 'Cape Verde', '', 'CV', 'CPV', '238'),
(37, 'Camboya', 'Cambodia', '', 'KH', 'KHM', '855'),
(38, 'Camer&uacute;n', 'Cameroon', '', 'CM', 'CMR', '237'),
(39, 'Canad&aacute;', 'Canada', '', 'CA', 'CAN', '1'),
(40, 'Chad', 'Chad', '', 'TD', 'TCD', '235'),
(41, 'Chile', 'Chile', '', 'CL', 'CHL', '56'),
(42, 'China', 'China', '', 'CN', 'CHN', '86'),
(43, 'Chipre', 'Cyprus', '', 'CY', 'CYP', '357'),
(44, 'Ciudad del Vaticano', 'Vatican City State', '', 'VA', 'VAT', '39'),
(45, 'Colombia', 'Colombia', '', 'CO', 'COL', '57'),
(46, 'Comoras', 'Comoros', '', 'KM', 'COM', '269'),
(47, 'Congo', 'Congo', '', 'CG', 'COG', '242'),
(48, 'Congo', 'Congo', '', 'CD', 'COD', '243'),
(49, 'Corea del Norte', 'North Korea', '', 'KP', 'PRK', '850'),
(50, 'Corea del Sur', 'South Korea', '', 'KR', 'KOR', '82'),
(51, 'Costa de Marfil', 'Ivory Coast', '', 'CI', 'CIV', '225'),
(52, 'Costa Rica', 'Costa Rica', '', 'CR', 'CRI', '506'),
(53, 'Croacia', 'Croatia', '', 'HR', 'HRV', '385'),
(54, 'Cuba', 'Cuba', '', 'CU', 'CUB', '53'),
(55, 'Dinamarca', 'Denmark', '', 'DK', 'DNK', '45'),
(56, 'Dominica', 'Dominica', '', 'DM', 'DMA', '1 767'),
(57, 'Ecuador', 'Ecuador', '', 'EC', 'ECU', '593'),
(58, 'Egipto', 'Egypt', '', 'EG', 'EGY', '20'),
(59, 'El Salvador', 'El Salvador', '', 'SV', 'SLV', '503'),
(60, 'Emiratos &aacute;rabes Unidos', 'United Arab Emirates', '', 'AE', 'ARE', '971'),
(61, 'Eritrea', 'Eritrea', '', 'ER', 'ERI', '291'),
(62, 'Eslovaquia', 'Slovakia', '', 'SK', 'SVK', '421'),
(63, 'Eslovenia', 'Slovenia', '', 'SI', 'SVN', '386'),
(64, 'Espa&ntilde;a', 'Spain', '', 'ES', 'ESP', '34'),
(65, 'Estados Unidos de Am&eacute;rica', 'United States of America', '', 'US', 'USA', '1'),
(66, 'Estonia', 'Estonia', '', 'EE', 'EST', '372'),
(67, 'Etiop&iacute;a', 'Ethiopia', '', 'ET', 'ETH', '251'),
(68, 'Filipinas', 'Philippines', '', 'PH', 'PHL', '63'),
(69, 'Finlandia', 'Finland', '', 'FI', 'FIN', '358'),
(70, 'Fiyi', 'Fiji', '', 'FJ', 'FJI', '679'),
(71, 'Francia', 'France', '', 'FR', 'FRA', '33'),
(72, 'Gab&oacute;n', 'Gabon', '', 'GA', 'GAB', '241'),
(73, 'Gambia', 'Gambia', '', 'GM', 'GMB', '220'),
(74, 'Georgia', 'Georgia', '', 'GE', 'GEO', '995'),
(75, 'Ghana', 'Ghana', '', 'GH', 'GHA', '233'),
(76, 'Gibraltar', 'Gibraltar', '', 'GI', 'GIB', '350'),
(77, 'Granada', 'Grenada', '', 'GD', 'GRD', '1 473'),
(78, 'Grecia', 'Greece', '', 'GR', 'GRC', '30'),
(79, 'Groenlandia', 'Greenland', '', 'GL', 'GRL', '299'),
(80, 'Guadalupe', 'Guadeloupe', '', 'GP', 'GLP', ''),
(81, 'Guam', 'Guam', '', 'GU', 'GUM', '1 671'),
(82, 'Guatemala', 'Guatemala', '', 'GT', 'GTM', '502'),
(83, 'Guayana Francesa', 'French Guiana', '', 'GF', 'GUF', ''),
(84, 'Guernsey', 'Guernsey', '', 'GG', 'GGY', ''),
(85, 'Guinea', 'Guinea', '', 'GN', 'GIN', '224'),
(86, 'Guinea Ecuatorial', 'Equatorial Guinea', '', 'GQ', 'GNQ', '240'),
(87, 'Guinea-Bissau', 'Guinea-Bissau', '', 'GW', 'GNB', '245'),
(88, 'Guyana', 'Guyana', '', 'GY', 'GUY', '592'),
(89, 'Hait&iacute;', 'Haiti', '', 'HT', 'HTI', '509'),
(90, 'Honduras', 'Honduras', '', 'HN', 'HND', '504'),
(91, 'Hong kong', 'Hong Kong', '', 'HK', 'HKG', '852'),
(92, 'Hungr&iacute;a', 'Hungary', '', 'HU', 'HUN', '36'),
(93, 'India', 'India', '', 'IN', 'IND', '91'),
(94, 'Indonesia', 'Indonesia', '', 'ID', 'IDN', '62'),
(95, 'Ir&aacute;n', 'Iran', '', 'IR', 'IRN', '98'),
(96, 'Irak', 'Iraq', '', 'IQ', 'IRQ', '964'),
(97, 'Irlanda', 'Ireland', '', 'IE', 'IRL', '353'),
(98, 'Isla Bouvet', 'Bouvet Island', '', 'BV', 'BVT', ''),
(99, 'Isla de Man', 'Isle of Man', '', 'IM', 'IMN', '44'),
(100, 'Isla de Navidad', 'Christmas Island', '', 'CX', 'CXR', '61'),
(101, 'Isla Norfolk', 'Norfolk Island', '', 'NF', 'NFK', ''),
(102, 'Islandia', 'Iceland', '', 'IS', 'ISL', '354'),
(103, 'Islas Bermudas', 'Bermuda Islands', '', 'BM', 'BMU', '1 441'),
(104, 'Islas Caim&aacute;n', 'Cayman Islands', '', 'KY', 'CYM', '1 345'),
(105, 'Islas Cocos (Keeling)', 'Cocos (Keeling) Islands', '', 'CC', 'CCK', '61'),
(106, 'Islas Cook', 'Cook Islands', '', 'CK', 'COK', '682'),
(107, 'Islas de ?land', '?land Islands', '', 'AX', 'ALA', ''),
(108, 'Islas Feroe', 'Faroe Islands', '', 'FO', 'FRO', '298'),
(109, 'Islas Georgias del Sur y Sandwich del Sur', 'South Georgia and the South Sandwich Islands', '', 'GS', 'SGS', ''),
(110, 'Islas Heard y McDonald', 'Heard Island and McDonald Islands', '', 'HM', 'HMD', ''),
(111, 'Islas Maldivas', 'Maldives', '', 'MV', 'MDV', '960'),
(112, 'Islas Malvinas', 'Falkland Islands (Malvinas)', '', 'FK', 'FLK', '500'),
(113, 'Islas Marianas del Norte', 'Northern Mariana Islands', '', 'MP', 'MNP', '1 670'),
(114, 'Islas Marshall', 'Marshall Islands', '', 'MH', 'MHL', '692'),
(115, 'Islas Pitcairn', 'Pitcairn Islands', '', 'PN', 'PCN', '870'),
(116, 'Islas Salom&oacute;n', 'Solomon Islands', '', 'SB', 'SLB', '677'),
(117, 'Islas Turcas y Caicos', 'Turks and Caicos Islands', '', 'TC', 'TCA', '1 649'),
(118, 'Islas Ultramarinas Menores de Estados Unidos', 'United States Minor Outlying Islands', '', 'UM', 'UMI', ''),
(119, 'Islas V&iacute;rgenes Brit&aacute;nicas', 'Virgin Islands', '', 'VG', 'VG', '1 284'),
(120, 'Islas V&iacute;rgenes de los Estados Unidos', 'United States Virgin Islands', '', 'VI', 'VIR', '1 340'),
(121, 'Israel', 'Israel', '', 'IL', 'ISR', '972'),
(122, 'Italia', 'Italy', '', 'IT', 'ITA', '39'),
(123, 'Jamaica', 'Jamaica', '', 'JM', 'JAM', '1 876'),
(124, 'Jap&oacute;n', 'Japan', '', 'JP', 'JPN', '81'),
(125, 'Jersey', 'Jersey', '', 'JE', 'JEY', ''),
(126, 'Jordania', 'Jordan', '', 'JO', 'JOR', '962'),
(127, 'Kazajist&aacute;n', 'Kazakhstan', '', 'KZ', 'KAZ', '7'),
(128, 'Kenia', 'Kenya', '', 'KE', 'KEN', '254'),
(129, 'Kirgizst&aacute;n', 'Kyrgyzstan', '', 'KG', 'KGZ', '996'),
(130, 'Kiribati', 'Kiribati', '', 'KI', 'KIR', '686'),
(131, 'Kuwait', 'Kuwait', '', 'KW', 'KWT', '965'),
(132, 'L&iacute;bano', 'Lebanon', '', 'LB', 'LBN', '961'),
(133, 'Laos', 'Laos', '', 'LA', 'LAO', '856'),
(134, 'Lesoto', 'Lesotho', '', 'LS', 'LSO', '266'),
(135, 'Letonia', 'Latvia', '', 'LV', 'LVA', '371'),
(136, 'Liberia', 'Liberia', '', 'LR', 'LBR', '231'),
(137, 'Libia', 'Libya', '', 'LY', 'LBY', '218'),
(138, 'Liechtenstein', 'Liechtenstein', '', 'LI', 'LIE', '423'),
(139, 'Lituania', 'Lithuania', '', 'LT', 'LTU', '370'),
(140, 'Luxemburgo', 'Luxembourg', '', 'LU', 'LUX', '352'),
(141, 'M&eacute;xico', 'Mexico', '', 'MX', 'MEX', '52'),
(142, 'M&oacute;naco', 'Monaco', '', 'MC', 'MCO', '377'),
(143, 'Macao', 'Macao', '', 'MO', 'MAC', '853'),
(144, 'Maced?nia', 'Macedonia', '', 'MK', 'MKD', '389'),
(145, 'Madagascar', 'Madagascar', '', 'MG', 'MDG', '261'),
(146, 'Malasia', 'Malaysia', '', 'MY', 'MYS', '60'),
(147, 'Malawi', 'Malawi', '', 'MW', 'MWI', '265'),
(148, 'Mali', 'Mali', '', 'ML', 'MLI', '223'),
(149, 'Malta', 'Malta', '', 'MT', 'MLT', '356'),
(150, 'Marruecos', 'Morocco', '', 'MA', 'MAR', '212'),
(151, 'Martinica', 'Martinique', '', 'MQ', 'MTQ', ''),
(152, 'Mauricio', 'Mauritius', '', 'MU', 'MUS', '230'),
(153, 'Mauritania', 'Mauritania', '', 'MR', 'MRT', '222'),
(154, 'Mayotte', 'Mayotte', '', 'YT', 'MYT', '262'),
(155, 'Micronesia', 'Estados Federados de', '', 'FM', 'FSM', '691'),
(156, 'Moldavia', 'Moldova', '', 'MD', 'MDA', '373'),
(157, 'Mongolia', 'Mongolia', '', 'MN', 'MNG', '976'),
(158, 'Montenegro', 'Montenegro', '', 'ME', 'MNE', '382'),
(159, 'Montserrat', 'Montserrat', '', 'MS', 'MSR', '1 664'),
(160, 'Mozambique', 'Mozambique', '', 'MZ', 'MOZ', '258'),
(161, 'Namibia', 'Namibia', '', 'NA', 'NAM', '264'),
(162, 'Nauru', 'Nauru', '', 'NR', 'NRU', '674'),
(163, 'Nepal', 'Nepal', '', 'NP', 'NPL', '977'),
(164, 'Nicaragua', 'Nicaragua', '', 'NI', 'NIC', '505'),
(165, 'Niger', 'Niger', '', 'NE', 'NER', '227'),
(166, 'Nigeria', 'Nigeria', '', 'NG', 'NGA', '234'),
(167, 'Niue', 'Niue', '', 'NU', 'NIU', '683'),
(168, 'Noruega', 'Norway', '', 'NO', 'NOR', '47'),
(169, 'Nueva Caledonia', 'New Caledonia', '', 'NC', 'NCL', '687'),
(170, 'Nueva Zelanda', 'New Zealand', '', 'NZ', 'NZL', '64'),
(171, 'Om&aacute;n', 'Oman', '', 'OM', 'OMN', '968'),
(172, 'Pa&iacute;ses Bajos', 'Netherlands', '', 'NL', 'NLD', '31'),
(173, 'Pakist&aacute;n', 'Pakistan', '', 'PK', 'PAK', '92'),
(174, 'Palau', 'Palau', '', 'PW', 'PLW', '680'),
(175, 'Palestina', 'Palestine', '', 'PS', 'PSE', ''),
(176, 'Panam&aacute;', 'Panama', '', 'PA', 'PAN', '507'),
(177, 'Pap&uacute;a Nueva Guinea', 'Papua New Guinea', '', 'PG', 'PNG', '675'),
(178, 'Paraguay', 'Paraguay', '', 'PY', 'PRY', '595'),
(179, 'Per&uacute;', 'Peru', '', 'PE', 'PER', '51'),
(180, 'Polinesia Francesa', 'French Polynesia', '', 'PF', 'PYF', '689'),
(181, 'Polonia', 'Poland', '', 'PL', 'POL', '48'),
(182, 'Portugal', 'Portugal', '', 'PT', 'PRT', '351'),
(183, 'Puerto Rico', 'Puerto Rico', '', 'PR', 'PRI', '1'),
(184, 'Qatar', 'Qatar', '', 'QA', 'QAT', '974'),
(185, 'Reino Unido', 'United Kingdom', '', 'GB', 'GBR', '44'),
(186, 'Rep&uacute;blica Centroafricana', 'Central African Republic', '', 'CF', 'CAF', '236'),
(187, 'Rep&uacute;blica Checa', 'Czech Republic', '', 'CZ', 'CZE', '420'),
(188, 'Rep&uacute;blica Dominicana', 'Dominican Republic', '', 'DO', 'DOM', '1 809'),
(189, 'Reuni&oacute;n', 'R&eacute;union', '', 'RE', 'REU', ''),
(190, 'Ruanda', 'Rwanda', '', 'RW', 'RWA', '250'),
(191, 'Ruman&iacute;a', 'Romania', '', 'RO', 'ROU', '40'),
(192, 'Rusia', 'Russia', '', 'RU', 'RUS', '7'),
(193, 'Sahara Occidental', 'Western Sahara', '', 'EH', 'ESH', ''),
(194, 'Samoa', 'Samoa', '', 'WS', 'WSM', '685'),
(195, 'Samoa Americana', 'American Samoa', '', 'AS', 'ASM', '1 684'),
(196, 'San Bartolom&eacute;', 'Saint Barth&eacute;lemy', '', 'BL', 'BLM', '590'),
(197, 'San Crist&oacute;bal y Nieves', 'Saint Kitts and Nevis', '', 'KN', 'KNA', '1 869'),
(198, 'San Marino', 'San Marino', '', 'SM', 'SMR', '378'),
(199, 'San Mart&iacute;n (Francia)', 'Saint Martin (French part)', '', 'MF', 'MAF', '1 599'),
(200, 'San Pedro y Miquel&oacute;n', 'Saint Pierre and Miquelon', '', 'PM', 'SPM', '508'),
(201, 'San Vicente y las Granadinas', 'Saint Vincent and the Grenadines', '', 'VC', 'VCT', '1 784'),
(202, 'Santa Elena', 'Ascensi&oacute;n y Trist&aacute;n de Acu&ntilde;a', '', 'SH', 'SHN', '290'),
(203, 'Santa Luc&iacute;a', 'Saint Lucia', '', 'LC', 'LCA', '1 758'),
(204, 'Santo Tom&eacute; y Pr&iacute;ncipe', 'Sao Tome and Principe', '', 'ST', 'STP', '239'),
(205, 'Senegal', 'Senegal', '', 'SN', 'SEN', '221'),
(206, 'Serbia', 'Serbia', '', 'RS', 'SRB', '381'),
(207, 'Seychelles', 'Seychelles', '', 'SC', 'SYC', '248'),
(208, 'Sierra Leona', 'Sierra Leone', '', 'SL', 'SLE', '232'),
(209, 'Singapur', 'Singapore', '', 'SG', 'SGP', '65'),
(210, 'Siria', 'Syria', '', 'SY', 'SYR', '963'),
(211, 'Somalia', 'Somalia', '', 'SO', 'SOM', '252'),
(212, 'Sri lanka', 'Sri Lanka', '', 'LK', 'LKA', '94'),
(213, 'Sud&aacute;frica', 'South Africa', '', 'ZA', 'ZAF', '27'),
(214, 'Sud&aacute;n', 'Sudan', '', 'SD', 'SDN', '249'),
(215, 'Suecia', 'Sweden', '', 'SE', 'SWE', '46'),
(216, 'Suiza', 'Switzerland', '', 'CH', 'CHE', '41'),
(217, 'Surin&aacute;m', 'Suriname', '', 'SR', 'SUR', '597'),
(218, 'Svalbard y Jan Mayen', 'Svalbard and Jan Mayen', '', 'SJ', 'SJM', ''),
(219, 'Swazilandia', 'Swaziland', '', 'SZ', 'SWZ', '268'),
(220, 'Tadjikist&aacute;n', 'Tajikistan', '', 'TJ', 'TJK', '992'),
(221, 'Tailandia', 'Thailand', '', 'TH', 'THA', '66'),
(222, 'Taiw&aacute;n', 'Taiwan', '', 'TW', 'TWN', '886'),
(223, 'Tanzania', 'Tanzania', '', 'TZ', 'TZA', '255'),
(224, 'Territorio Brit&aacute;nico del Oc&eacute;ano &iacute;ndico', 'British Indian Ocean Territory', '', 'IO', 'IOT', ''),
(225, 'Territorios Australes y Ant&aacute;rticas Franceses', 'French Southern Territories', '', 'TF', 'ATF', ''),
(226, 'Timor Oriental', 'East Timor', '', 'TL', 'TLS', '670'),
(227, 'Togo', 'Togo', '', 'TG', 'TGO', '228'),
(228, 'Tokelau', 'Tokelau', '', 'TK', 'TKL', '690'),
(229, 'Tonga', 'Tonga', '', 'TO', 'TON', '676'),
(230, 'Trinidad y Tobago', 'Trinidad and Tobago', '', 'TT', 'TTO', '1 868'),
(231, 'Tunez', 'Tunisia', '', 'TN', 'TUN', '216'),
(232, 'Turkmenist&aacute;n', 'Turkmenistan', '', 'TM', 'TKM', '993'),
(233, 'Turqu&iacute;a', 'Turkey', '', 'TR', 'TUR', '90'),
(234, 'Tuvalu', 'Tuvalu', '', 'TV', 'TUV', '688'),
(235, 'Ucrania', 'Ukraine', '', 'UA', 'UKR', '380'),
(236, 'Uganda', 'Uganda', '', 'UG', 'UGA', '256'),
(237, 'Uruguay', 'Uruguay', '', 'UY', 'URY', '598'),
(238, 'Uzbekist&aacute;n', 'Uzbekistan', '', 'UZ', 'UZB', '998'),
(239, 'Vanuatu', 'Vanuatu', '', 'VU', 'VUT', '678'),
(240, 'Venezuela', 'Venezuela', '', 'VE', 'VEN', '58'),
(241, 'Vietnam', 'Vietnam', '', 'VN', 'VNM', '84'),
(242, 'Wallis y Futuna', 'Wallis and Futuna', '', 'WF', 'WLF', '681'),
(243, 'Yemen', 'Yemen', '', 'YE', 'YEM', '967'),
(244, 'Yibuti', 'Djibouti', '', 'DJ', 'DJI', '253'),
(245, 'Zambia', 'Zambia', '', 'ZM', 'ZMB', '260'),
(246, 'Zimbabue', 'Zimbabwe', '', 'ZW', 'ZWE', '263');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `document` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `documenttype` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailaddress` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `document`, `documenttype`, `firstname`, `lastname`, `company`, `emailaddress`, `address`, `city`, `province`, `country`, `phone`, `mobile`) VALUES
(1, '1088287018', 'CC', 'Jhonny Mauricio', 'Orrego Hernandez', 'Cero K', 'jhonnyorrego@gmail.com', 'Mz 5 Ca 3 Independientes Cuba', 'Pereira', 'Risaralda', 'CO', '3333333', '3113666666'),
(2, '1088287055', 'CC', 'Lizeth Jhoana', 'Mayuza', 'Independiente', 'jhoana@gmail.com', '', '', '', 'CO', '', ''),
(3, '1088287069', 'CC', 'Roy', 'Pedroza', 'Restaurante la Florida', '', '', '', '', 'CO', '', ''),
(4, '1088287068', 'CC', 'Roy', 'Pedroza', '', 'roy@gmail.com', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_estado_trans`
--

CREATE TABLE `persona_estado_trans` (
  `idpersona_estado_trans` int(11) NOT NULL,
  `fk_idpersona_transaccion` int(11) NOT NULL,
  `fk_idpersona` int(11) NOT NULL,
  `transactionid` int(11) DEFAULT NULL,
  `sessionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requestdate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankprocessdate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ontest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `returncode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trazabilitycode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transactioncycle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transactionstate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsecode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsereasoncode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsereasontext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_transaccion`
--

CREATE TABLE `persona_transaccion` (
  `idpersona_transaccion` int(11) NOT NULL,
  `fk_idpersona` int(11) NOT NULL,
  `returncode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankurl` text COLLATE utf8_unicode_ci,
  `trazabilitycode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transactioncycle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transactionid` int(11) DEFAULT NULL,
  `sessionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankcurrency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankfactor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsecode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsereasoncode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsereasontext` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idpais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `persona_estado_trans`
--
ALTER TABLE `persona_estado_trans`
  ADD PRIMARY KEY (`idpersona_estado_trans`),
  ADD KEY `fk_idpersona_transaccion` (`fk_idpersona_transaccion`),
  ADD KEY `fk_idpersona` (`fk_idpersona`);

--
-- Indices de la tabla `persona_transaccion`
--
ALTER TABLE `persona_transaccion`
  ADD PRIMARY KEY (`idpersona_transaccion`),
  ADD KEY `fk_idpersona` (`fk_idpersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idpais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `persona_estado_trans`
--
ALTER TABLE `persona_estado_trans`
  MODIFY `idpersona_estado_trans` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persona_transaccion`
--
ALTER TABLE `persona_transaccion`
  MODIFY `idpersona_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
