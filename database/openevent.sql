-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2021 a las 18:07:37
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `openevent`
--
CREATE DATABASE IF NOT EXISTS `openevent` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `openevent`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assistance`
--

CREATE TABLE `assistance` (
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `puntuation` int(11) NOT NULL,
  `comentary` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `assistance`
--

INSERT INTO `assistance` (`user_id`, `event_id`, `puntuation`, `comentary`) VALUES
(57, 3, 2, 'Drain of L Up Leg Muscle with Drain Dev, Perc Endo Approach'),
(47, 4, 3, 'Dilation of Left Foot Artery, Bifurc, Perc Endo Approach'),
(67, 5, 2, 'Revision of Autol Sub in R Acromioclav Jt, Open Approach'),
(62, 7, 4, 'Supplement R Subclav Vein with Autol Sub, Perc Approach'),
(57, 8, 2, 'Drainage of Lung Lingula, Endo'),
(8, 9, 4, 'Fragmentation in Jejunum, Percutaneous Approach'),
(70, 13, 4, 'HDR Brachytherapy of Bone Marrow using Californium 252'),
(62, 16, 5, 'Destruction of Right Popliteal Artery, Percutaneous Approach'),
(83, 19, 3, 'Division of Left Lower Femur, Percutaneous Approach'),
(54, 20, 2, 'Reposition Right Fibula with Ring Ext Fix, Open Approach'),
(64, 21, 5, 'Excision of Right Vitreous, Percutaneous Approach'),
(8, 22, 1, 'Extirpation of Matter from Up Tooth, Mult, Extern Approach'),
(41, 23, 4, 'Revision of Synthetic Substitute in Cerv Jt, Open Approach'),
(72, 26, 5, 'Insertion of VAD into Chest Subcu/Fascia, Perc Approach'),
(90, 27, 4, 'Drainage of R Post Tib Art, Perc Approach, Diagn'),
(78, 29, 3, 'Repair Left Ulna, Percutaneous Approach'),
(70, 30, 1, 'Dilate L Ext Carotid, Bifurc, w 4+ Intralum Dev, Perc Endo'),
(84, 32, 1, 'Bypass 4+ Cor Art from Cor Art w Nonaut Sub, Perc Endo'),
(43, 33, 3, 'Excision of Pineal Body, Percutaneous Approach'),
(26, 36, 4, 'Resection of Right Rib, Open Approach'),
(98, 39, 5, 'Replace of R Metatarsophal Jt with Nonaut Sub, Open Approach'),
(38, 41, 3, 'Restriction of Left Kidney Pelvis, Via Opening'),
(67, 42, 4, 'Insertion of Radioact Elem into R Ankle, Perc Endo Approach'),
(99, 44, 2, 'Assist with Cardiac Output using Impeller Pump, Intermittent'),
(41, 46, 1, 'Dilate Face Art, Bifurc, w 2 Intralum Dev, Open'),
(98, 48, 2, 'Excision of Left Radial Artery, Open Approach, Diagnostic'),
(21, 50, 3, 'Removal of Monitoring Device from Low Intest Tract, Endo'),
(94, 51, 4, 'Revision of Ext Fix in R Toe Phalanx, Extern Approach');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `eventStart_date` date NOT NULL,
  `eventEnd_date` date NOT NULL,
  `n_participators` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id`, `name`, `owner_id`, `date`, `image`, `location`, `description`, `eventStart_date`, `eventEnd_date`, `n_participators`, `type`) VALUES
(1, 'Keylex', 91, '2021-04-28', 'http://dummyimage.com/235x100.png/cc0000/ffffff', '33 Sugar Place', 'Revise of Synth Sub in Up Extrem Subcu/Fascia, Perc Approach', '2020-09-25', '2020-06-14', 71, 'Sport'),
(2, 'Tampflex', 16, '2021-04-28', 'http://dummyimage.com/145x100.png/5fa2dd/ffffff', '4654 Parkside Drive', 'Drainage of Left Knee Region with Drain Dev, Open Approach', '2020-11-18', '2020-12-06', 5, 'Food'),
(3, 'Tempsoft', 49, '2021-04-28', 'http://dummyimage.com/146x100.png/ff4444/ffffff', '02738 Sunnyside Street', 'Insert of Intralum Dev into R Less Saphenous, Open Approach', '2020-06-26', '2021-04-19', 100, 'Culture'),
(4, 'Prodder', 38, '2021-04-28', 'http://dummyimage.com/146x100.png/cc0000/ffffff', '41 Mariners Cove Point', 'Reattachment of Right Tunica Vaginalis, Open Approach', '2020-08-31', '2020-06-28', 79, 'Music'),
(5, 'Zaam-Dox', 88, '2021-04-28', 'http://dummyimage.com/245x100.png/5fa2dd/ffffff', '8 Spohn Drive', 'Revision of Synth Sub in Low Bursa/Lig, Perc Approach', '2020-09-14', '2021-02-05', 57, 'Travel'),
(6, 'Biodex', 19, '2021-04-28', 'http://dummyimage.com/154x100.png/dddddd/000000', '570 Drewry Lane', 'Transplantation of Eye into POC, Via Opening', '2021-01-19', '2020-11-25', 74, 'Travel'),
(7, 'Stringtough', 74, '2021-04-28', 'http://dummyimage.com/102x100.png/dddddd/000000', '3 Lillian Trail', 'Change Other Device in Lower Jaw, External Approach', '2021-03-29', '2020-06-22', 95, 'Food'),
(8, 'Alpha', 99, '2021-04-28', 'http://dummyimage.com/146x100.png/dddddd/000000', '9753 Logan Parkway', 'Bypass R Ext Iliac Art to Low Ex Art, Perc Endo Approach', '2021-03-10', '2020-11-04', 52, 'Music'),
(9, 'Zamit', 35, '2021-04-28', 'http://dummyimage.com/199x100.png/cc0000/ffffff', '40 Division Junction', 'Fusion L Metacarpophal Jt w Int Fix, Perc Endo', '2021-03-08', '2020-11-26', 33, 'Culture'),
(10, 'Aerified', 37, '2021-04-28', 'http://dummyimage.com/157x100.png/ff4444/ffffff', '5 Westend Crossing', 'Extirpate of Matter from L Carotid Body, Perc Endo Approach', '2021-04-13', '2021-01-03', 20, 'Music'),
(11, 'Zathin', 72, '2021-04-28', 'http://dummyimage.com/189x100.png/dddddd/000000', '621 Pierstorff Street', 'Revision of Synth Sub in Prostate/Seminal Ves, Perc Approach', '2020-07-23', '2021-04-23', 44, 'World'),
(12, 'Span', 92, '2021-04-28', 'http://dummyimage.com/226x100.png/dddddd/000000', '5 Tomscot Point', 'Supplement L Thorax Bursa/Lig w Nonaut Sub, Perc Endo', '2020-07-24', '2020-12-26', 6, 'Sport'),
(13, 'Tampflex', 24, '2021-04-28', 'http://dummyimage.com/232x100.png/5fa2dd/ffffff', '14 Grover Parkway', 'Control Bleeding in Lower Back, Open Approach', '2020-06-17', '2020-09-26', 4, 'World'),
(14, 'Overhold', 71, '2021-04-28', 'http://dummyimage.com/218x100.png/5fa2dd/ffffff', '11435 Macpherson Crossing', 'Revision of Nonaut Sub in R Carpal Jt, Extern Approach', '2020-12-19', '2020-11-16', 78, 'World'),
(15, 'Zathin', 58, '2021-04-28', 'http://dummyimage.com/196x100.png/cc0000/ffffff', '547 Paget Court', 'Change Intermittent Pressure Device on Chest Wall', '2020-11-05', '2020-07-22', 36, 'Sport'),
(16, 'Cardify', 81, '2021-04-28', 'http://dummyimage.com/179x100.png/ff4444/ffffff', '48228 Towne Point', 'Reposition R Femur Shaft with Intramed Fix, Open Approach', '2020-07-10', '2021-04-23', 62, 'World'),
(18, 'Pannier', 33, '2021-04-28', 'http://dummyimage.com/222x100.png/5fa2dd/ffffff', '5 Fordem Park', 'Extraction of R Shoulder Bursa/Lig, Open Approach', '2020-10-29', '2020-07-30', 89, 'Travel'),
(19, 'Alpha', 95, '2021-04-28', 'http://dummyimage.com/202x100.png/ff4444/ffffff', '28 Stuart Park', 'Altern Bi/Mon Loud Bal Assessment using AV Equipment', '2021-03-07', '2021-04-13', 42, 'Culture'),
(20, 'Alphazap', 40, '2021-04-28', 'http://dummyimage.com/155x100.png/ff4444/ffffff', '464 Little Fleur Point', 'Excision of Right Inferior Parathyroid Gland, Open Approach', '2020-12-13', '2021-04-21', 62, 'Music'),
(21, 'Greenlam', 52, '2021-04-28', 'http://dummyimage.com/124x100.png/cc0000/ffffff', '4 Stone Corner Court', 'Revision of Infusion Device in L Wrist Jt, Perc Approach', '2020-09-26', '2020-12-04', 10, 'Music'),
(22, 'Zathin', 59, '2021-04-28', 'http://dummyimage.com/150x100.png/ff4444/ffffff', '9633 Ilene Trail', 'Bypass L Brach Art to Low Arm Vein w Autol Art, Open', '2020-06-21', '2020-07-19', 15, 'Travel'),
(23, 'Andalax', 73, '2021-04-28', 'http://dummyimage.com/181x100.png/ff4444/ffffff', '4862 Hayes Parkway', 'Revision of Infusion Device in Cereb Vent, Perc Approach', '2021-01-18', '2021-03-11', 85, 'Culture'),
(25, 'Holdlamis', 83, '2021-04-28', 'http://dummyimage.com/172x100.png/ff4444/ffffff', '7 Browning Lane', 'Dilate L Thyroid Art w 2 Intralum Dev, Perc Endo', '2020-06-09', '2021-04-22', 33, 'Sport'),
(26, 'Tempsoft', 77, '2021-04-28', 'http://dummyimage.com/171x100.png/dddddd/000000', '7998 Mcbride Pass', 'Restriction of Left Basilic Vein, Perc Endo Approach', '2020-06-20', '2020-08-19', 76, 'Food'),
(27, 'Redhold', 1, '2021-04-28', 'http://dummyimage.com/203x100.png/cc0000/ffffff', '8747 Bowman Junction', 'Change Other Device in Right Lung, External Approach', '2020-08-26', '2020-08-21', 71, 'Sport'),
(28, 'Sub-Ex', 100, '2021-04-28', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', '36286 Monument Way', 'Insertion of Pedcl Stabl Dev into Lum Jt, Perc Endo Approach', '2020-10-25', '2020-10-13', 78, 'Travel'),
(29, 'Sub-Ex', 65, '2021-04-28', 'http://dummyimage.com/132x100.png/cc0000/ffffff', '6 Briar Crest Alley', 'Excision of Lower Tooth, External Approach, Single', '2020-12-10', '2020-07-20', 79, 'Sport'),
(30, 'Vagram', 45, '2021-04-28', 'http://dummyimage.com/159x100.png/dddddd/000000', '913 Fisk Circle', 'Insertion of Monitor Dev into Azygos Vein, Open Approach', '2021-01-20', '2021-02-07', 34, 'World'),
(31, 'Bitwolf', 79, '2021-04-28', 'http://dummyimage.com/166x100.png/5fa2dd/ffffff', '951 Pierstorff Street', 'Fusion of Coccygeal Joint with Synth Sub, Open Approach', '2021-04-17', '2020-09-07', 21, 'Music'),
(32, 'Konklux', 66, '2021-04-28', 'http://dummyimage.com/162x100.png/5fa2dd/ffffff', '059 Monterey Pass', 'Occlusion Splenic Vein w Intralum Dev, Perc Endo', '2021-01-22', '2020-09-12', 2, 'Sport'),
(33, 'Fintone', 22, '2021-04-28', 'http://dummyimage.com/158x100.png/dddddd/000000', '9977 Dennis Point', 'Removal of Ext Fix from R Fibula, Extern Approach', '2020-12-31', '2020-07-26', 8, 'Travel'),
(34, 'Asoka', 43, '2021-04-28', 'http://dummyimage.com/215x100.png/dddddd/000000', '0 Eagan Junction', 'Introduction of Electrol/Water Bal into Low GI, Endo', '2020-08-20', '2021-02-22', 71, 'World'),
(35, 'Tresom', 20, '2021-04-28', 'http://dummyimage.com/159x100.png/dddddd/000000', '2 Heffernan Court', 'Resection of Products of Conception, Ectopic, Open Approach', '2021-03-19', '2020-05-12', 2, 'Culture'),
(36, 'Andalax', 76, '2021-04-28', 'http://dummyimage.com/139x100.png/ff4444/ffffff', '51 East Road', 'Insert Infusion Dev in R Cephalic Vein, Perc Endo', '2020-09-01', '2021-02-24', 30, 'Music'),
(37, 'Fixflex', 31, '2021-04-28', 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', '39941 Arkansas Drive', 'Drainage of Bilateral Adrenal Glands, Open Approach', '2020-05-06', '2020-05-26', 3, 'Travel'),
(38, 'Vagram', 97, '2021-04-28', 'http://dummyimage.com/171x100.png/cc0000/ffffff', '7 Southridge Junction', 'Release Right Large Intestine, Open Approach', '2020-11-28', '2020-10-19', 98, 'Culture'),
(39, 'Stim', 78, '2021-04-28', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', '0799 Lindbergh Park', 'Revision of Ext Fix in R Elbow Jt, Perc Endo Approach', '2021-02-08', '2020-07-24', 45, 'Culture'),
(40, 'It', 54, '2021-04-28', 'http://dummyimage.com/184x100.png/cc0000/ffffff', '69035 Magdeline Avenue', 'Removal of Traction Apparatus on Face', '2020-12-24', '2020-09-18', 32, 'Sport'),
(41, 'Voyatouch', 17, '2021-04-28', 'http://dummyimage.com/107x100.png/cc0000/ffffff', '68 Warbler Circle', 'Removal of Nonaut Sub from Stomach, Perc Endo Approach', '2020-05-06', '2020-06-29', 80, 'World'),
(42, 'Solarbreeze', 82, '2021-04-28', 'http://dummyimage.com/161x100.png/dddddd/000000', '6 Division Hill', 'Dilate L Renal Art, Bifurc, w 4 Drug-elut, Open', '2021-01-26', '2020-09-22', 56, 'Travel'),
(44, 'Holdlamis', 87, '2021-04-28', 'http://dummyimage.com/159x100.png/5fa2dd/ffffff', '9807 Knutson Drive', 'Supplement Pulmonary Trunk with Zooplastic, Perc Approach', '2020-11-29', '2020-05-11', 45, 'Food'),
(45, 'Quo Lux', 11, '2021-04-28', 'http://dummyimage.com/198x100.png/5fa2dd/ffffff', '4 Homewood Circle', 'Insertion of Monitoring Device into Bladder, Open Approach', '2020-08-28', '2021-04-12', 16, 'Food'),
(46, 'Sonsing', 93, '2021-04-28', 'http://dummyimage.com/205x100.png/5fa2dd/ffffff', '382 Rockefeller Street', 'Supplement Right Knee Tendon with Autol Sub, Open Approach', '2021-02-16', '2021-01-24', 37, 'Food'),
(47, 'Fintone', 29, '2021-04-28', 'http://dummyimage.com/144x100.png/dddddd/000000', '401 Hudson Way', 'Bypass Middle Esophagus to Cutaneous with Autol Sub, Endo', '2020-10-08', '2021-02-08', 72, 'Sport'),
(48, 'Voyatouch', 51, '2021-04-28', 'http://dummyimage.com/112x100.png/ff4444/ffffff', '8769 Katie Point', 'Inspection of Right Wrist Region, Open Approach', '2020-11-03', '2020-05-16', 68, 'Music'),
(49, 'Rank', 90, '2021-04-28', 'http://dummyimage.com/133x100.png/ff4444/ffffff', '509 Parkside Hill', 'ROM & Jt Mobility Trmt Musculosk Up Back/UE w Prosthesis', '2020-10-03', '2021-03-29', 74, 'Travel'),
(50, 'Latlux', 96, '2021-04-28', 'http://dummyimage.com/135x100.png/dddddd/000000', '14 Holmberg Lane', 'Drainage of Thorax Lymphatic with Drain Dev, Open Approach', '2020-09-05', '2020-10-28', 100, 'Culture'),
(51, 'Cardify', 26, '2021-04-28', 'http://dummyimage.com/177x100.png/cc0000/ffffff', '27 Grover Park', 'Excision of R Metacarpophal Jt, Perc Endo Approach, Diagn', '2020-09-19', '2020-06-27', 57, 'Culture');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friends`
--

CREATE TABLE `friends` (
  `user_id` int(11) NOT NULL,
  `user_id_friend` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `friends`
--

INSERT INTO `friends` (`user_id`, `user_id_friend`, `status`) VALUES
(3, 7, 0),
(4, 20, 0),
(6, 75, 0),
(8, 85, 0),
(10, 89, 0),
(11, 21, 0),
(17, 93, 0),
(19, 23, 0),
(20, 17, 0),
(24, 58, 0),
(33, 86, 0),
(34, 99, 0),
(36, 78, 0),
(37, 87, 0),
(39, 47, 0),
(41, 71, 0),
(42, 1, 0),
(44, 59, 0),
(45, 75, 0),
(54, 44, 0),
(56, 3, 0),
(57, 56, 0),
(59, 68, 0),
(60, 79, 0),
(61, 42, 0),
(63, 17, 0),
(65, 15, 0),
(69, 21, 0),
(70, 20, 0),
(74, 7, 0),
(76, 30, 0),
(77, 14, 0),
(80, 59, 0),
(83, 40, 0),
(84, 84, 0),
(86, 5, 0),
(89, 89, 0),
(91, 58, 0),
(92, 91, 0),
(93, 11, 0),
(100, 56, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id_send` int(11) NOT NULL,
  `user_id_recived` int(11) NOT NULL,
  `timeStamp` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `message`
--

INSERT INTO `message` (`id`, `content`, `user_id_send`, `user_id_recived`, `timeStamp`) VALUES
(1, 'Occlusion of Low Art with Extralum Dev, Perc Endo Approach', 35, 45, '2021-04-28'),
(2, 'Dilate R Ext Iliac Art, Bifurc, w 4 Drug-elut, Open', 78, 95, '2021-04-28'),
(3, 'Occlusion of R Axilla Lymph with Intralum Dev, Perc Approach', 44, 16, '2021-04-28'),
(4, 'ROM/Jt Integrity Assessment of Musculosk Low Back/LE', 51, 21, '2021-04-28'),
(5, 'Drainage of Cerebral Ventricle, Perc Endo Approach, Diagn', 8, 99, '2021-04-28'),
(6, 'Extirpation of Matter from Left Kidney Pelvis, Open Approach', 28, 17, '2021-04-28'),
(7, 'Remove Autol Sub from Epididymis/Sperm Cord, Perc Endo', 68, 75, '2021-04-28'),
(8, 'Destruction of Neck Skin, Multiple, External Approach', 96, 48, '2021-04-28'),
(9, 'Restrict Thor Aorta Asc w Fenestr Dev 3+, Perc', 19, 15, '2021-04-28'),
(10, 'Bypass Stomach to Cutaneous with Synth Sub, Open Approach', 27, 37, '2021-04-28'),
(11, 'Revision of Intraluminal Device in Lymphatic, Perc Approach', 65, 22, '2021-04-28'),
(12, 'Alteration of Left Upper Eyelid, Percutaneous Approach', 75, 93, '2021-04-28'),
(13, 'Exercise Trmt Musculosk Up Back/UE w Physical Agent', 12, 86, '2021-04-28'),
(14, 'Dilate R Temporal Art, Bifurc, w 2 Drug-elut, Perc', 11, 78, '2021-04-28'),
(15, 'Introduction of Oth Therap Subst into Muscle, Perc Approach', 69, 69, '2021-04-28'),
(16, 'Reposition C-thor Jt with Int Fix, Extern Approach', 93, 85, '2021-04-28'),
(17, 'Insertion of Spacer into Right Knee Joint, Perc Approach', 12, 55, '2021-04-28'),
(18, 'Revision of Extraluminal Device in Right Eye, Endo', 76, 36, '2021-04-28'),
(19, 'Resection of Cisterna Chyli, Perc Endo Approach', 51, 36, '2021-04-28'),
(20, 'Supplement Perineum Muscle with Autol Sub, Open Approach', 15, 87, '2021-04-28'),
(21, 'Excision of R Low Leg Muscle, Perc Endo Approach, Diagn', 59, 35, '2021-04-28'),
(22, 'Fusion of R Metatarsotars Jt with Int Fix, Perc Approach', 48, 42, '2021-04-28'),
(23, 'Bypass Abd Aorta to R Ext Ilia w Nonaut Sub, Open', 92, 81, '2021-04-28'),
(24, 'Drainage of Thoracic Nerve, Perc Endo Approach, Diagn', 86, 13, '2021-04-28'),
(25, 'Replacement of Buccal Mucosa with Nonaut Sub, Open Approach', 24, 64, '2021-04-28'),
(26, 'Excision of Uvula, Open Approach, Diagnostic', 21, 25, '2021-04-28'),
(27, 'Supplement Left Knee Tendon with Autol Sub, Open Approach', 21, 88, '2021-04-28'),
(28, 'Fragmentation in Right Parotid Duct, Via Opening', 76, 77, '2021-04-28'),
(29, 'Drainage of Bone Marrow, Percutaneous Approach, Diagnostic', 45, 47, '2021-04-28'),
(30, 'Dilate R Fem Art w Intralum Dev, Drug Blln, Perc', 61, 13, '2021-04-28'),
(31, 'Revision of Synth Sub in Thoracic Duct, Open Approach', 13, 67, '2021-04-28'),
(32, 'Excision of Right Knee Region, Open Approach, Diagnostic', 83, 6, '2021-04-28'),
(33, 'Removal of Synth Sub from Vagina & Cul-de-sac, Open Approach', 87, 74, '2021-04-28'),
(34, 'Supplement L Low Extrem with Nonaut Sub, Open Approach', 27, 44, '2021-04-28'),
(35, 'Drainage of Right Kidney, Percutaneous Endoscopic Approach', 98, 14, '2021-04-28'),
(36, 'Revision of Drainage Device in Urethra, Endo', 96, 18, '2021-04-28'),
(37, 'Replace L Foot Skin w Autol Sub, Part Thick, Extern', 74, 63, '2021-04-28'),
(38, 'Insertion of Spacer into Right Elbow Joint, Perc Approach', 34, 86, '2021-04-28'),
(39, 'Replacement of Nasal Bone with Synth Sub, Open Approach', 40, 2, '2021-04-28'),
(40, 'Fluoroscopy of L Pelvic Vein using H Osm Contrast', 91, 2, '2021-04-28'),
(41, 'Occlusion of Right Upper Lobe Bronchus, Perc Approach', 6, 34, '2021-04-28'),
(42, 'Repair Right Hip Bursa and Ligament, Open Approach', 98, 21, '2021-04-28'),
(43, 'Stereotactic Particulate Radiosurgery of Testis', 17, 22, '2021-04-28'),
(44, 'Replacement of L Ankle Tendon with Synth Sub, Open Approach', 44, 9, '2021-04-28'),
(45, 'Revision of Ext Fix in L Metacarpal, Extern Approach', 80, 29, '2021-04-28'),
(46, 'Bypass R Axilla Art to L Up Leg Art w Autol Vn, Open', 73, 41, '2021-04-28'),
(47, 'Change Packing Material on Right Upper Leg', 37, 98, '2021-04-28'),
(48, 'Bypass Pancreas to Lg Int with Intralum Dev, Open Approach', 36, 11, '2021-04-28'),
(49, 'Repair Left Hand, Percutaneous Endoscopic Approach', 96, 10, '2021-04-28'),
(50, 'Repair Thoracic Sympathetic Nerve, Perc Endo Approach', 98, 2, '2021-04-28'),
(51, 'Destruction of Right Metatarsal, Perc Endo Approach', 12, 42, '2021-04-28'),
(52, 'Occlusion of Trachea, Percutaneous Approach', 51, 57, '2021-04-28'),
(53, 'Revision of Monitor Dev in Azygos Vein, Extern Approach', 52, 13, '2021-04-28'),
(54, 'Drainage of L Metacarpophal Jt with Drain Dev, Perc Approach', 49, 96, '2021-04-28'),
(55, 'Release Ant Neck Subcu/Fascia, Perc Approach', 8, 25, '2021-04-28'),
(56, 'Replacement of R Int Iliac Art with Synth Sub, Open Approach', 31, 82, '2021-04-28'),
(57, 'Bypass Thor Aorta Desc to Pulm Trunk w Nonaut Sub, Perc Endo', 70, 40, '2021-04-28'),
(58, 'Restrict R Com Carotid w Extralum Dev, Perc Endo', 19, 69, '2021-04-28'),
(59, 'Drainage of Ileocecal Valve with Drain Dev, Perc Approach', 41, 71, '2021-04-28'),
(60, 'Drainage of Left Lower Leg, Percutaneous Endoscopic Approach', 67, 30, '2021-04-28'),
(61, 'Wound Mgmt Trmt Musculosk Low Back/LE w Physical Agent', 63, 70, '2021-04-28'),
(62, 'Acoustic Reflex Patterns Assessment using Tympanometer', 9, 65, '2021-04-28'),
(63, 'Dilation of Right Thyroid Artery, Perc Endo Approach', 64, 29, '2021-04-28'),
(64, 'Female Reproductive System, Reposition', 11, 99, '2021-04-28'),
(65, 'Drainage of Upper Vein, Perc Endo Approach, Diagn', 84, 96, '2021-04-28'),
(66, 'Repair Male Perineum, Percutaneous Endoscopic Approach', 24, 21, '2021-04-28'),
(67, 'Drainage of L Ankle with Drain Dev, Perc Endo Approach', 3, 34, '2021-04-28'),
(68, 'Resection of Penis, Open Approach', 72, 39, '2021-04-28'),
(69, 'Occlusion R Ext Iliac Art w Intralum Dev, Perc', 49, 49, '2021-04-28'),
(70, 'Destruction of Right Middle Lung Lobe, Perc Endo Approach', 59, 5, '2021-04-28'),
(71, 'Insertion of Infusion Dev into L Ant Tib Art, Open Approach', 67, 86, '2021-04-28'),
(72, 'Bypass Jejunum to Asc Colon w Autol Sub, Perc Endo', 48, 40, '2021-04-28'),
(73, 'Insertion of Radioactive Element into Left Lung, Via Opening', 42, 51, '2021-04-28'),
(74, 'Fluoroscopy of Left Lower Extremity Veins', 48, 97, '2021-04-28'),
(75, 'Beam Radiation of Cervix using Neutrons', 71, 82, '2021-04-28'),
(76, 'Drainage of Left Metacarpal, Open Approach', 17, 52, '2021-04-28'),
(77, 'Release Left Lower Arm Skin, External Approach', 8, 73, '2021-04-28'),
(78, 'Replacement of L Atrium with Synth Sub, Perc Endo Approach', 17, 44, '2021-04-28'),
(79, 'Drainage of L Up Lobe Bronc with Drain Dev, Via Opening', 1, 14, '2021-04-28'),
(80, 'Dilation of 2 Cor Art, Bifurc, Open Approach', 43, 4, '2021-04-28'),
(81, 'Bypass L Pulm Art from Subclav w Nonaut Sub, Open', 81, 26, '2021-04-28'),
(82, 'Removal of Drainage Device from Finger Nail, Extern Approach', 74, 75, '2021-04-28'),
(83, 'Planar Nucl Med Imag of Low Extrem using Indium 111', 82, 16, '2021-04-28'),
(84, 'Removal of Autol Sub from R Low Extrem, Extern Approach', 72, 45, '2021-04-28'),
(85, 'Fusion of L Metatarsophal Jt with Int Fix, Perc Approach', 93, 59, '2021-04-28'),
(86, 'Supplement Large Intestine with Synth Sub, Via Opening', 87, 54, '2021-04-28'),
(87, 'Fluoroscopy R Int Carotid w L Osm Contrast, Laser Intraop', 78, 84, '2021-04-28'),
(88, 'Alteration of Left Lower Leg, Perc Endo Approach', 42, 49, '2021-04-28'),
(89, 'Computerized Tomography (CT Scan) of L Low Extrem Art', 39, 17, '2021-04-28'),
(90, 'Drainage of Right Ankle Tendon with Drain Dev, Perc Approach', 5, 70, '2021-04-28'),
(91, 'Reattachment of Left Adrenal Gland, Perc Endo Approach', 61, 99, '2021-04-28'),
(92, 'Dilation of Right Foot Vein, Perc Endo Approach', 35, 47, '2021-04-28'),
(93, 'Release Vagus Nerve, Percutaneous Endoscopic Approach', 94, 41, '2021-04-28'),
(94, 'Occlusion R Face Vein w Intralum Dev, Perc Endo', 86, 46, '2021-04-28'),
(95, 'Replace of L Thyroid Art with Nonaut Sub, Perc Endo Approach', 13, 51, '2021-04-28'),
(96, 'Release Nasal Septum, Percutaneous Approach', 57, 61, '2021-04-28'),
(97, 'Alteration of Right Knee Region, Percutaneous Approach', 27, 79, '2021-04-28'),
(98, 'Replace of L Toe Phalanx with Nonaut Sub, Perc Endo Approach', 87, 45, '2021-04-28'),
(99, 'Revision of Autol Sub in R Knee Jt, Open Approach', 89, 69, '2021-04-28'),
(100, 'Release Left Vocal Cord, Open Approach', 96, 34, '2021-04-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `image`, `name`, `last_name`, `email`, `password`) VALUES
(1, 'http://dummyimage.com/155x100.png/ff4444/ffffff', 'Meryl', 'Mowbray', 'mmowbray0@php.net', 'a1c7fd40e8287f68cd0abf63d4465e60e89d4c9a17caeca737aedadaf115700b'),
(2, 'http://dummyimage.com/212x100.png/ff4444/ffffff', 'Gaspard', 'Danihelka', 'gdanihelka1@hostgator.com', 'd108c1f538acb1bf30e93377ae3a80174d2b07f0514666ccb9353424a70c6674'),
(3, 'http://dummyimage.com/194x100.png/5fa2dd/ffffff', 'Hollie', 'Potten', 'hpotten2@umich.edu', '48fa3f0e062c342c5431a4636929f9360ab56eec54bd1934e9e9454082c4fa2b'),
(4, 'http://dummyimage.com/230x100.png/5fa2dd/ffffff', 'Valida', 'Lemmertz', 'vlemmertz3@mozilla.org', 'd51106031f9d1f4689f6ca501518909dffe9e14d751b3da7c8207d94b76e9645'),
(5, 'http://dummyimage.com/239x100.png/cc0000/ffffff', 'Aloisia', 'Taillard', 'ataillard4@nytimes.com', '7f4cc4f377fadd1c3cb9d55008b0bf409274339fa509a337cdc75b020631aae1'),
(6, 'http://dummyimage.com/249x100.png/ff4444/ffffff', 'Lian', 'Andrzej', 'landrzej5@goo.gl', 'ace506c58659aa354aa8b39e1743e5159c8d82ef1e714d4d01c200545cff5512'),
(7, 'http://dummyimage.com/152x100.png/5fa2dd/ffffff', 'Tova', 'Lambart', 'tlambart6@cyberchimps.com', 'a87f89a80a92bc4a7092ffa8540c498134900ed6057bc14750f48fcef992af64'),
(8, 'http://dummyimage.com/203x100.png/dddddd/000000', 'Skipp', 'Youles', 'syoules7@php.net', 'fc12047bc5276ef3b7f59d3b9f6d3288f8194038a02bab431ca793ae48f6355c'),
(9, 'http://dummyimage.com/187x100.png/ff4444/ffffff', 'Morey', 'McCarrick', 'mmccarrick8@topsy.com', '5040a44ae5624a99e11bf481eeef80100036323511db407c0b13c0e972f6aef5'),
(10, 'http://dummyimage.com/147x100.png/ff4444/ffffff', 'Dannye', 'Goodread', 'dgoodread9@deviantart.com', '9a2fc95a891a8384c0f8928eafd246988329444ca67b977d7f34b7ee1d079947'),
(11, 'http://dummyimage.com/194x100.png/ff4444/ffffff', 'Thomasine', 'Langstone', 'tlangstonea@altervista.org', '37d605d3404d9b971a7cabcc6103c5a35b1dc27054316557ce4f975a24824fff'),
(12, 'http://dummyimage.com/217x100.png/ff4444/ffffff', 'Adolphus', 'Pettifor', 'apettiforb@e-recht24.de', '32f086704a5bcb2445b0265488ae71ab51ad8942f4326bead990d9cf754a9e53'),
(13, 'http://dummyimage.com/234x100.png/dddddd/000000', 'Constantin', 'Whytock', 'cwhytockc@squidoo.com', '95a762bc82b61406fc65785de295d41db841f15f1d3cb16a9672fd22da7a8db1'),
(14, 'http://dummyimage.com/137x100.png/cc0000/ffffff', 'Carita', 'Provost', 'cprovostd@dell.com', 'fea682a6a8107905413ab6b0052b7d478ef10f72d1d907dac5f5dbf7fe7a83fc'),
(15, 'http://dummyimage.com/156x100.png/ff4444/ffffff', 'Wren', 'Ewbanck', 'wewbancke@europa.eu', '11f937d9380ffb2784c4d468b3f5419e1f63a54f8d0d38e38f47d2c3066be7df'),
(16, 'http://dummyimage.com/200x100.png/cc0000/ffffff', 'Harold', 'Clougher', 'hclougherf@prweb.com', '4c0e499b12ff6b923a5b7a1c353c1c2976820184b87f1db36e2227794c3d030e'),
(17, 'http://dummyimage.com/238x100.png/5fa2dd/ffffff', 'Hortensia', 'Crosser', 'hcrosserg@independent.co.uk', 'cf67b91331e681c1719e119a1aa08ead34436109dbc4fc0cb58690f539bbd1cf'),
(18, 'http://dummyimage.com/193x100.png/ff4444/ffffff', 'Tobe', 'Alpine', 'talpineh@slideshare.net', 'abf41a2114af82ecaa0a8550c6d729c8eb1aa094c825cf72b51560706306c07c'),
(19, 'http://dummyimage.com/220x100.png/ff4444/ffffff', 'Ogden', 'Alejandri', 'oalejandrii@geocities.jp', '4ebfab713aa65d97530b5765cdd3688fe0c1e64a7b76d2045edc093a1486fa21'),
(20, 'http://dummyimage.com/194x100.png/ff4444/ffffff', 'Jill', 'Fance', 'jfancej@house.gov', '67ee3c00003aadeacd54c69f624cc2b214b3805285e45ed494f7e374171f2076'),
(21, 'http://dummyimage.com/119x100.png/dddddd/000000', 'Delphine', 'Lamey', 'dlameyk@techcrunch.com', '9cc0e7b3b5c019d52a18206bd1cc3818a766cbcec172e6288a3674e77db98503'),
(22, 'http://dummyimage.com/146x100.png/ff4444/ffffff', 'Freddie', 'Trobridge', 'ftrobridgel@cbsnews.com', '030dd7a10ada1bf49b3d49a723c96cfd890fb31c817e3b48ef7229ef8bfac13b'),
(23, 'http://dummyimage.com/228x100.png/dddddd/000000', 'Phebe', 'Villa', 'pvillam@symantec.com', '447b39ffa837104eec0f6b443a4985da0456eced877ed2d34bdb0f935f3373f3'),
(24, 'http://dummyimage.com/123x100.png/dddddd/000000', 'Nev', 'Van Der Vlies', 'nvandervliesn@gov.uk', '565d759abb2de43eb765f4826b8cb7129208be27544a8cbab9c8c4207ec95d24'),
(25, 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', 'Raimundo', 'Eymer', 'reymero@about.me', 'e2f775a41b5d57b440f0bdb06e7d321355620bc48fdcee8aa7fb8a5f3a000acf'),
(26, 'http://dummyimage.com/204x100.png/cc0000/ffffff', 'Ethel', 'Sueter', 'esueterp@1und1.de', 'a11e97d6c63d64114f88b91c5c565c5d4c0773c7f1d6070731a3adb25b9dd670'),
(27, 'http://dummyimage.com/219x100.png/cc0000/ffffff', 'Wenona', 'Twinberrow', 'wtwinberrowq@webeden.co.uk', 'c68e769a8003438af77fc668014cba799ac0fe2b93e37188b0f24bf39d0b6ed2'),
(28, 'http://dummyimage.com/210x100.png/ff4444/ffffff', 'Townsend', 'Maskelyne', 'tmaskelyner@edublogs.org', '0617684f808eae776ea72f1a422fa724b87c424986c7e2885ff6404be13e186c'),
(29, 'http://dummyimage.com/106x100.png/cc0000/ffffff', 'Anthia', 'Sibbson', 'asibbsons@sun.com', '7c4f6046a4a456e1834da8ff94edb3c93310475e996d49bc6c6b99ca67e20256'),
(30, 'http://dummyimage.com/235x100.png/ff4444/ffffff', 'Serene', 'Grafham', 'sgrafhamt@bing.com', 'b1a92b11ac80c8e5b5cb21cfd1ba30c076e86cde7720a8b865a731b8c9f3a475'),
(31, 'http://dummyimage.com/205x100.png/dddddd/000000', 'Pen', 'O\'Keaveny', 'pokeavenyu@typepad.com', '155ea4ff53c7ff75c115f1bb39d3be02b56b3c022491902f840d65f141936e33'),
(32, 'http://dummyimage.com/140x100.png/ff4444/ffffff', 'Casper', 'Spurdle', 'cspurdlev@123-reg.co.uk', 'd743051703efa4724be2b2e27f36cf4da83d0c553805bac586ef4d275ef1958a'),
(33, 'http://dummyimage.com/176x100.png/dddddd/000000', 'Kendal', 'Cuckoo', 'kcuckoow@cam.ac.uk', 'baad8e2d2b062aa4f9101e8251a7504ae05e46146ddf43595d6beb6af40ff466'),
(34, 'http://dummyimage.com/102x100.png/5fa2dd/ffffff', 'Malina', 'Fielding', 'mfieldingx@umich.edu', 'abdb4f36e7a9ad3c92d86f62c6c85b34651707f0a7e7fe141c0b836ced07ce15'),
(35, 'http://dummyimage.com/172x100.png/cc0000/ffffff', 'Barnaby', 'Klosges', 'bklosgesy@cnet.com', '316f3fa110c64d8569a189c4eebf49267be3b65c6cf8b727a2c2000f82c3b894'),
(36, 'http://dummyimage.com/190x100.png/dddddd/000000', 'Dodie', 'MacGuiness', 'dmacguinessz@gov.uk', '4e5bca7c1a589676bc8b62085686a22593b7d9240d7e680a083db16630cd19f2'),
(37, 'http://dummyimage.com/138x100.png/5fa2dd/ffffff', 'Brandyn', 'Gall', 'bgall10@trellian.com', 'f5f571a3bd8012908b21e782eaa40eeee9bba49d442fa6a3148b87b903445ebb'),
(38, 'http://dummyimage.com/231x100.png/ff4444/ffffff', 'Vicky', 'Raynes', 'vraynes11@slideshare.net', '260c08eee16f32693f1e4b4313ffc43027481f5ac8239086416f56303b9fd430'),
(39, 'http://dummyimage.com/192x100.png/ff4444/ffffff', 'Aymer', 'Compford', 'acompford12@mtv.com', 'da8dd1923f830b7419854443258afc2f1e75be215944aa7bc64bb0c6ec02b739'),
(40, 'http://dummyimage.com/206x100.png/5fa2dd/ffffff', 'Garold', 'Dunsmuir', 'gdunsmuir13@intel.com', 'cfd48349fd7a842ffa6536852619f365d0cbe8920665f110170d7d0c7d1063b9'),
(41, 'http://dummyimage.com/243x100.png/ff4444/ffffff', 'Courtney', 'Schiesterl', 'cschiesterl14@cornell.edu', '362071d0b3c2cf64999ce1d7d5280d85ad5b04bc5d9ffc04fe82c4ef247113dd'),
(42, 'http://dummyimage.com/150x100.png/cc0000/ffffff', 'Gib', 'Perutto', 'gperutto15@home.pl', 'c520ddc751d3a04795b42238c619fc99ffdbea137f22885d17bdb97d67bcab11'),
(43, 'http://dummyimage.com/103x100.png/dddddd/000000', 'Debera', 'Merchant', 'dmerchant16@sakura.ne.jp', '48f71e5af34f4f6f2661478d98ef5a40a0e0d6db76534dbeabb412098134e72d'),
(44, 'http://dummyimage.com/103x100.png/dddddd/000000', 'Hedwig', 'Cloughton', 'hcloughton17@marketwatch.com', '9ac299e43223703dabe941f2816eed6f0c03689e83586db0863a9b9cc3699ecd'),
(45, 'http://dummyimage.com/202x100.png/dddddd/000000', 'Brett', 'Lorenzo', 'blorenzo18@furl.net', '88d7bef423682c6d4b29a06515cb81ebdf9dc91089aae8d0dc68861ba385d11f'),
(46, 'http://dummyimage.com/167x100.png/dddddd/000000', 'Meryl', 'Kestin', 'mkestin19@fotki.com', '7975f54abd29d178ff417233a6bdc7b537ec37b3c9bca9572ef739ab6d9c26b9'),
(47, 'http://dummyimage.com/198x100.png/dddddd/000000', 'Goldarina', 'Grealish', 'ggrealish1a@prlog.org', '605dbaf2f8293e99152eef46a9731ad301e9f2b7ed793af2604ac07b5f22a7f5'),
(48, 'http://dummyimage.com/133x100.png/5fa2dd/ffffff', 'Emlyn', 'Loughan', 'eloughan1b@ihg.com', '2861300c6eaa39bd77a7948cdff5971b50ff10010c8ea475378ee8e2e0035225'),
(49, 'http://dummyimage.com/210x100.png/dddddd/000000', 'Marlene', 'Shingler', 'mshingler1c@technorati.com', 'c8308dd850b361f0cd5475364f403489144111dcabeacc08db917caacda79c6f'),
(50, 'http://dummyimage.com/177x100.png/5fa2dd/ffffff', 'Margery', 'Baal', 'mbaal1d@nydailynews.com', 'a42271419982f1a293879335b2cca641a64dade758ed98a7f049d02d8bf6f1bf'),
(51, 'http://dummyimage.com/223x100.png/cc0000/ffffff', 'Hedvig', 'Benmore', 'hbenmore1e@xrea.com', 'b2441b5eabaa7813be6d438400dfb60a62fd0267d0586a745bbf36d8928ed210'),
(52, 'http://dummyimage.com/170x100.png/ff4444/ffffff', 'Billy', 'Sherington', 'bsherington1f@tamu.edu', 'b1dd1b721ba7c763fe94a41a73945f3413388f8fbb6b8aa9f11dfc1b7d1798e0'),
(53, 'http://dummyimage.com/241x100.png/5fa2dd/ffffff', 'Christophorus', 'Giraudat', 'cgiraudat1g@sogou.com', '965d78e67b5369a4134b887cd25114b27e2bb87e29ad9968d61fb5c7d7b441a4'),
(54, 'http://dummyimage.com/228x100.png/5fa2dd/ffffff', 'Ludovika', 'Ailward', 'lailward1h@shop-pro.jp', 'ca11065eb23f8baa2a343ae619e22a405280ac5f9c562695c719da0385b6ec4f'),
(55, 'http://dummyimage.com/151x100.png/cc0000/ffffff', 'Corey', 'Shayler', 'cshayler1i@miibeian.gov.cn', '3c349ee2e871fb7537baf934bf8defd97f626ba158535122ca0de0f8188dddfc'),
(56, 'http://dummyimage.com/183x100.png/ff4444/ffffff', 'Tomi', 'Janks', 'tjanks1j@myspace.com', '856face894260f775dc6ece045c65a158df6d7545936691526415eec0c9d16b3'),
(57, 'http://dummyimage.com/236x100.png/dddddd/000000', 'Lavinie', 'Stackbridge', 'lstackbridge1k@dedecms.com', '71c9e35cf92ec0666b036c5bda7836caa4b816292c1318368f6877d1a04daa0d'),
(58, 'http://dummyimage.com/134x100.png/dddddd/000000', 'Manya', 'Dillestone', 'mdillestone1l@dedecms.com', '07e2427badc4e5924ce1c3ce6e9013556b1ba4b7dec9ea7708a3248738594c6f'),
(59, 'http://dummyimage.com/242x100.png/cc0000/ffffff', 'Shadow', 'Hartas', 'shartas1m@networkadvertising.org', '2a536753eef449fe66bc9c25b63c18660f5289acd051f8f6cf21aa14d43b8ed3'),
(60, 'http://dummyimage.com/105x100.png/ff4444/ffffff', 'Rozina', 'Benadette', 'rbenadette1n@multiply.com', '23a27e5b130d2c342854e392c4b404c6a130cad0774513d1013baaaa5b33a4bc'),
(61, 'http://dummyimage.com/226x100.png/ff4444/ffffff', 'Lesley', 'Iddons', 'liddons1o@t-online.de', '71e571fe010ebdf2383fb6579f7ef91017c202c09b76b56d85707bf4d5c87f3a'),
(62, 'http://dummyimage.com/148x100.png/ff4444/ffffff', 'D\'arcy', 'Scragg', 'dscragg1p@chronoengine.com', '0d23fbc8b7be7c16dba7cade22ae57c66e8e60ff1ea96240352e50af995dd757'),
(63, 'http://dummyimage.com/229x100.png/5fa2dd/ffffff', 'Arlena', 'Heatlie', 'aheatlie1q@geocities.com', '39965c6d09a1930e0e0666190265c46bd851afd1f81f4e464453513b1c08a099'),
(64, 'http://dummyimage.com/175x100.png/dddddd/000000', 'Kalil', 'Beswell', 'kbeswell1r@china.com.cn', '50af3a5656c13d3d482d87466e6bfe14a64fb428ed6fee145f0a78198c90be3c'),
(65, 'http://dummyimage.com/246x100.png/dddddd/000000', 'Donny', 'Flaherty', 'dflaherty1s@sourceforge.net', '6ae2bd7ee2a11be3ccac33cadcdc44e6b6bdf9b7d243fd5e76e6d1b7c94a0e5e'),
(66, 'http://dummyimage.com/173x100.png/dddddd/000000', 'Beale', 'Danilyak', 'bdanilyak1t@example.com', '5d0291f5c072924eafdb49ad0749079cb633249302d3bcb694a3259246e53350'),
(67, 'http://dummyimage.com/121x100.png/dddddd/000000', 'Helene', 'Azema', 'hazema1u@unicef.org', '84259ffc0cac811fa71b8bff61249f7fdb1152235c03d36bb4e3a4fc20109221'),
(68, 'http://dummyimage.com/146x100.png/ff4444/ffffff', 'Phedra', 'Parkyns', 'pparkyns1v@vk.com', 'd5bf4eca3c5aeca322bb17535d6962667dbacfe37f06b6d8ab2ae59e2007a409'),
(69, 'http://dummyimage.com/199x100.png/5fa2dd/ffffff', 'Barbabra', 'Hissie', 'bhissie1w@pinterest.com', 'e3030e1281297e4c709886a2100f803732007874d5c6a099339082fec911b009'),
(70, 'http://dummyimage.com/130x100.png/ff4444/ffffff', 'Neille', 'Warret', 'nwarret1x@dropbox.com', '714384437e6e744a9b807fabb999d61c37649819695da74866329d1daf6d143b'),
(71, 'http://dummyimage.com/180x100.png/cc0000/ffffff', 'Tarah', 'Flacknoe', 'tflacknoe1y@wikispaces.com', '165732250d1fee139470dc1b7e04c37f22c4d292412d1f529fbdb431fccaf1d8'),
(72, 'http://dummyimage.com/219x100.png/cc0000/ffffff', 'Rorie', 'Haverty', 'rhaverty1z@mapquest.com', '448c165afe30ae66fcbad28ccf8915ad24f8424cf04b6805a4db531009461ecc'),
(73, 'http://dummyimage.com/115x100.png/dddddd/000000', 'Ariel', 'Raynton', 'araynton20@theglobeandmail.com', '456be7cd34a218f661906c0a1c690cd16148c3dd12fa710aeae937cd08c03032'),
(74, 'http://dummyimage.com/172x100.png/dddddd/000000', 'Joycelin', 'Smead', 'jsmead21@artisteer.com', 'f4283e0e478383b9c03a3a1abbddf88a8e690ece085dd10c8e363ac762bfecb0'),
(75, 'http://dummyimage.com/195x100.png/dddddd/000000', 'Loutitia', 'Phizackarley', 'lphizackarley22@state.gov', 'bd750122a7dd46da245b1b9faa354a8c5c77c6c0e1b6505193de3f1c86921a3d'),
(76, 'http://dummyimage.com/152x100.png/ff4444/ffffff', 'Barney', 'Klicher', 'bklicher23@geocities.com', '7887c273fcd7a8012ddbc581e2337f581905a9a8989ba7f7740b5b1898b4105e'),
(77, 'http://dummyimage.com/169x100.png/5fa2dd/ffffff', 'Ranice', 'Asple', 'rasple24@bloglines.com', 'e3704cf0db5f453294e83c23a245b32bd47f1572bbdca637d4d76c0673349243'),
(78, 'http://dummyimage.com/125x100.png/5fa2dd/ffffff', 'Augy', 'Blondin', 'ablondin25@livejournal.com', 'b1e2a6e39229aa553474d9a2e0a0202eab4c488b8cc55bba57511e174fcd22c4'),
(79, 'http://dummyimage.com/112x100.png/ff4444/ffffff', 'Editha', 'Gueinn', 'egueinn26@ed.gov', '9706f1e196e23ed2cbf127ece9b09352adc074ff04fb6530a9a30611b476f945'),
(80, 'http://dummyimage.com/227x100.png/ff4444/ffffff', 'Mill', 'Vaadeland', 'mvaadeland27@bloomberg.com', '0dc2b859e7c308101ec4ec52f9293e713f1c5c85f82f1d5746ad54cd7ae94191'),
(81, 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', 'Torrie', 'Cortese', 'tcortese28@opera.com', '6f0db28a07cddeb39d506c280dd3505f8415917c4ed35036551e062f3f2357c3'),
(82, 'http://dummyimage.com/168x100.png/cc0000/ffffff', 'Lynnette', 'Sear', 'lsear29@parallels.com', '1676665e3a7754ac8cb43e13a3bdd8126d15c92d7ceb3bb47bbdb47d24d4ee64'),
(83, 'http://dummyimage.com/119x100.png/cc0000/ffffff', 'Dode', 'Merkel', 'dmerkel2a@360.cn', '8bd6f369949b844f441965b36fa72d083894dd97041e5e92ed4742e7afdc899c'),
(84, 'http://dummyimage.com/162x100.png/cc0000/ffffff', 'Ruby', 'Izhaky', 'rizhaky2b@wufoo.com', 'fc1f6d6266c4f46813ddc5bc35e325e3ec0926eb8571235bff4eb15655e9e0e8'),
(85, 'http://dummyimage.com/237x100.png/dddddd/000000', 'Gay', 'Winn', 'gwinn2c@noaa.gov', 'f0907dda7808de630592fbcffb8536f985e15363ad5f5f9be06b3674f1f85628'),
(86, 'http://dummyimage.com/126x100.png/cc0000/ffffff', 'Barret', 'Uttley', 'buttley2d@symantec.com', 'c24e29d1a0cf8d8c64a77cdcbb939bc151d8b76066ae862fca505f40e4f8f871'),
(87, 'http://dummyimage.com/157x100.png/ff4444/ffffff', 'Gabi', 'Worcs', 'gworcs2e@cbslocal.com', 'bc93ad272abab42c7dc005f9d90db686c6718f2d578aafad4584de21fcebb95e'),
(88, 'http://dummyimage.com/244x100.png/5fa2dd/ffffff', 'Verina', 'Sterry', 'vsterry2f@ezinearticles.com', '46032958d347cb12ba5bd525059d34db9f39647e3bbef117fbdbedce31225b00'),
(89, 'http://dummyimage.com/238x100.png/cc0000/ffffff', 'Cindie', 'Gryglewski', 'cgryglewski2g@free.fr', '0049305f1ebf3212ee15bfd682a33f28f30995c5176f9fe357c6a4fa16bc9f1f'),
(90, 'http://dummyimage.com/205x100.png/cc0000/ffffff', 'Jarad', 'Janaud', 'jjanaud2h@msn.com', 'bbf4c5f25369308b0a41191b835135ce0598c19353407511aa7cfad082c98e11'),
(91, 'http://dummyimage.com/166x100.png/cc0000/ffffff', 'Guillermo', 'Sidebotton', 'gsidebotton2i@istockphoto.com', '5a63eb92cde7a811374275b71168b31db0f9d9796cd093c9124f61bdfa346ca1'),
(92, 'http://dummyimage.com/122x100.png/ff4444/ffffff', 'Marga', 'McVanamy', 'mmcvanamy2j@europa.eu', '46235bc8663e6e5bcad794761da4aa15a821dbf5e6fd3659cee0811b34a62ccc'),
(93, 'http://dummyimage.com/132x100.png/cc0000/ffffff', 'Fancy', 'Dranfield', 'fdranfield2k@tiny.cc', '1dcb1db98c20f3f11969f2a7a29fd61bac723ad03cb648a55a8b6969dcef2639'),
(94, 'http://dummyimage.com/176x100.png/5fa2dd/ffffff', 'Tome', 'Fortie', 'tfortie2l@virginia.edu', '8c99bc30a03c81395c261d323556458e407e0c8c76292f91a23ce8364554c5a5'),
(95, 'http://dummyimage.com/108x100.png/dddddd/000000', 'Bastien', 'Firle', 'bfirle2m@nbcnews.com', '845384f6c950f0bc1f52234f72142e58f5d42ed26b561ed205229dc322e70518'),
(96, 'http://dummyimage.com/192x100.png/5fa2dd/ffffff', 'Gabriella', 'Adshede', 'gadshede2n@upenn.edu', '0b83c5763347d5670343b811c658799908cc465eb5e3116c69daab400fe02f64'),
(97, 'http://dummyimage.com/131x100.png/ff4444/ffffff', 'Roseanna', 'Duxbarry', 'rduxbarry2o@shutterfly.com', 'c9392edac15d6cad16c425e15176288a03f51b0a11d57852ac9f5b2961daac94'),
(98, 'http://dummyimage.com/226x100.png/5fa2dd/ffffff', 'Avivah', 'Daulton', 'adaulton2p@privacy.gov.au', 'a9f719f788f01a4e01177ecf2befc1cabc367710e6c6a862d067dce85e673fd6'),
(99, 'http://dummyimage.com/189x100.png/dddddd/000000', 'Jobyna', 'Erwin', 'jerwin2q@wikimedia.org', '9446b4162e8ddff094fb867bf6f154eec36ee49205813f3c246f22e88ce7a673'),
(100, 'http://dummyimage.com/184x100.png/dddddd/000000', 'Ewart', 'Topper', 'etopper2r@fema.gov', 'cabe20530ee34c0336ccc43803020c6bf6629e45ff1f0200870c4a88ed28021f');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `assistance`
--
ALTER TABLE `assistance`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `owner_id` (`owner_id`);

--
-- Indices de la tabla `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id_friend` (`user_id_friend`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_send` (`user_id_send`),
  ADD KEY `user_id_recived` (`user_id_recived`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `assistance`
--
ALTER TABLE `assistance`
  ADD CONSTRAINT `assistance_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assistance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`user_id_friend`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id_send`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`user_id_recived`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
