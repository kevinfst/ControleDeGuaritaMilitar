-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2023 at 08:18 PM
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
-- Table structure for table `escalasguarda`
--

CREATE TABLE `escalasguarda` (
  `id_escala` int(11) NOT NULL,
  `dt_diaSemana` date DEFAULT NULL,
  `dt_horarioInicio` time DEFAULT NULL,
  `dt_horarioFim` time DEFAULT NULL,
  `nm_patenteAutorizacao` varchar(20) DEFAULT NULL CHECK (`nm_patenteAutorizacao` in ('Sentinela','Comandante')),
  `cd_autorizadoEscalaGuarda` tinyint(1) DEFAULT 0,
  `cd_patenteUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trocashorario`
--

CREATE TABLE `trocashorario` (
  `id_troca` int(11) NOT NULL,
  `cd_soldadoSolicitante` int(11) DEFAULT NULL,
  `cd_soldadoAceitante` int(11) DEFAULT NULL,
  `dt_novoHorarioInicio` time DEFAULT NULL,
  `dt_novoHorarioFim` time DEFAULT NULL,
  `cd_autorizadoTrocasHorario` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nm_usuario` varchar(50) NOT NULL,
  `cd_idade` int(11) DEFAULT NULL,
  `dt_dataNascimento` date DEFAULT NULL,
  `nm_guerra` varchar(50) DEFAULT NULL,
  `nm_patente` varchar(20) DEFAULT NULL CHECK (`nm_patente` in ('Sentinela','Comandante')),
  `nm_usuarioLogin` varchar(50) NOT NULL,
  `cd_senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nm_usuario`, `cd_idade`, `dt_dataNascimento`, `nm_guerra`, `nm_patente`, `nm_usuarioLogin`, `cd_senha`) VALUES
(2, 'Nome do Usuário', 25, '1998-01-01', 'Apelido de Guerra', 'Sentinela', 'Nome de Usuário Login', 'Senha do Usuário'),
(3, 'awawwa', 13, '2023-11-04', 'aweaw', 'comandante', 'Cavalo695', '123455');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `escalasguarda`
--
ALTER TABLE `escalasguarda`
  ADD PRIMARY KEY (`id_escala`),
  ADD KEY `cd_patenteUsuario` (`cd_patenteUsuario`);

--
-- Indexes for table `trocashorario`
--
ALTER TABLE `trocashorario`
  ADD PRIMARY KEY (`id_troca`),
  ADD KEY `cd_soldadoSolicitante` (`cd_soldadoSolicitante`),
  ADD KEY `cd_soldadoAceitante` (`cd_soldadoAceitante`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nm_usuarioLogin` (`nm_usuarioLogin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `escalasguarda`
--
ALTER TABLE `escalasguarda`
  MODIFY `id_escala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trocashorario`
--
ALTER TABLE `trocashorario`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `escalasguarda`
--
ALTER TABLE `escalasguarda`
  ADD CONSTRAINT `escalasguarda_ibfk_1` FOREIGN KEY (`cd_patenteUsuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `trocashorario`
--
ALTER TABLE `trocashorario`
  ADD CONSTRAINT `trocashorario_ibfk_1` FOREIGN KEY (`cd_soldadoSolicitante`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `trocashorario_ibfk_2` FOREIGN KEY (`cd_soldadoAceitante`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
