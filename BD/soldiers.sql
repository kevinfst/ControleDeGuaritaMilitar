-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 12:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soldiers`
--

-- --------------------------------------------------------

--
-- Table structure for table `escala_guarda`
--

CREATE TABLE `escala_guarda` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo_escala` varchar(20) NOT NULL,
  `corte_cabelo_conformidade` tinyint(1) DEFAULT NULL,
  `identificacao_militar_conformidade` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `escala_guarda`
--

INSERT INTO `escala_guarda` (`id`, `id_usuario`, `tipo_escala`, `corte_cabelo_conformidade`, `identificacao_militar_conformidade`) VALUES
(77, 21, 'Cinza', 1, 0),
(78, 20, 'Vermelha', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registro_entrada_saida`
--

CREATE TABLE `registro_entrada_saida` (
  `id_registro` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_hora_entrada` datetime DEFAULT NULL,
  `data_hora_saida` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registro_entrada_saida`
--

INSERT INTO `registro_entrada_saida` (`id_registro`, `id_usuario`, `data_hora_entrada`, `data_hora_saida`) VALUES
(20, 20, '2023-11-26 19:55:28', '2023-11-26 19:55:33'),
(21, 21, '2023-11-26 20:01:18', '2023-11-26 20:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `troca_horario`
--

CREATE TABLE `troca_horario` (
  `id_troca` int(11) NOT NULL,
  `id_usuario_solicitante` int(11) DEFAULT NULL,
  `id_usuario_destinatario` int(11) DEFAULT NULL,
  `data_solicitacao` datetime DEFAULT NULL,
  `status_solicitacao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `troca_horario`
--

INSERT INTO `troca_horario` (`id_troca`, `id_usuario_solicitante`, `id_usuario_destinatario`, `data_solicitacao`, `status_solicitacao`) VALUES
(77, 20, 21, '2023-11-26 20:02:26', 'pendente'),
(78, 20, 21, '2023-11-26 20:02:27', 'pendente');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nm_usuario` varchar(50) NOT NULL,
  `cd_idade` int(11) DEFAULT NULL,
  `dt_dataNascimento` date DEFAULT NULL,
  `nm_guerra` varchar(50) DEFAULT NULL,
  `nm_patente` varchar(20) DEFAULT NULL,
  `nm_usuarioLogin` varchar(50) NOT NULL,
  `cd_senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nm_usuario`, `cd_idade`, `dt_dataNascimento`, `nm_guerra`, `nm_patente`, `nm_usuarioLogin`, `cd_senha`) VALUES
(20, '13', 13, '2023-11-28', '13', 'Comandante', '13', '13'),
(21, '15', 15, '2023-12-04', '15', 'Comandante', '15', '15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `escala_guarda`
--
ALTER TABLE `escala_guarda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `troca_horario`
--
ALTER TABLE `troca_horario`
  ADD PRIMARY KEY (`id_troca`),
  ADD KEY `id_usuario_solicitante` (`id_usuario_solicitante`),
  ADD KEY `id_usuario_destinatario` (`id_usuario_destinatario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `escala_guarda`
--
ALTER TABLE `escala_guarda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `troca_horario`
--
ALTER TABLE `troca_horario`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `escala_guarda`
--
ALTER TABLE `escala_guarda`
  ADD CONSTRAINT `escala_guarda_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  ADD CONSTRAINT `registro_entrada_saida_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `troca_horario`
--
ALTER TABLE `troca_horario`
  ADD CONSTRAINT `troca_horario_ibfk_1` FOREIGN KEY (`id_usuario_solicitante`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `troca_horario_ibfk_2` FOREIGN KEY (`id_usuario_destinatario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
