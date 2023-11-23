-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2023 at 11:32 PM
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
  `nome_soldado` varchar(255) NOT NULL,
  `patente` varchar(50) NOT NULL,
  `dia_hora_guarda` datetime NOT NULL,
  `tipo_escala` varchar(20) NOT NULL,
  `tempo_descanso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `escala_guarda`
--

INSERT INTO `escala_guarda` (`id`, `id_usuario`, `nome_soldado`, `patente`, `dia_hora_guarda`, `tipo_escala`, `tempo_descanso`) VALUES
(1, 1, 'Soldado 1', 'Sentinela', '2023-11-23 08:00:00', 'Escala Cinza', 240),
(2, 2, 'Soldado 2', 'Sentinela', '2023-11-24 14:00:00', 'Escala Vermelha', 240),
(3, 3, 'Comandante', 'Comandante da Guarda', '2023-11-25 20:00:00', 'Escala Cinza', 240),
(4, 4, 'Lucas Sepriano', 'Sentinela', '2023-11-23 23:15:54', 'Vermelho', 240);

-- --------------------------------------------------------

--
-- Table structure for table `registro_entrada_saida`
--

CREATE TABLE `registro_entrada_saida` (
  `id_registro` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_hora_entrada` datetime DEFAULT NULL,
  `data_hora_saida` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 1, 2, '2023-11-23 18:43:33', 'Pendente');

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
  `cd_senha` varchar(255) NOT NULL,
  `corte_cabelo_conformidade` tinyint(1) DEFAULT NULL,
  `identificacao_militar_conformidade` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nm_usuario`, `cd_idade`, `dt_dataNascimento`, `nm_guerra`, `nm_patente`, `nm_usuarioLogin`, `cd_senha`, `corte_cabelo_conformidade`, `identificacao_militar_conformidade`) VALUES
(1, 'Soldado 1', 25, '1998-01-01', 'Guerra1', 'Sentinela', 'soldado1', 'senha123', 1, 1),
(2, 'Soldado 2', 28, '1995-03-15', 'Guerra2', 'Sentinela', 'soldado2', 'senha456', 1, 1),
(3, 'Comandante', 35, '1988-07-20', 'GuerraC', 'Comandante da Guarda', 'comandante', 'senha789', 1, 1),
(4, 'Lucas Sepriano', 19, '2004-12-03', 'Espartano', 'sentinela', 'sepriano', '1234', 0, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `troca_horario`
--
ALTER TABLE `troca_horario`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
