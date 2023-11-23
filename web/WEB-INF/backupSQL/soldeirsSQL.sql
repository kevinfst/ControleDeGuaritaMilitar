-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/11/2023 às 02:39
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `soldeirs`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `descanso`
--

CREATE TABLE `descanso` (
  `DescansoID` int(11) NOT NULL,
  `SoldadoID` int(11) DEFAULT NULL,
  `HorarioInicio` time DEFAULT NULL,
  `HorarioFim` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entradassaidas`
--

CREATE TABLE `entradassaidas` (
  `RegistroID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `DataHoraEntrada` datetime DEFAULT NULL,
  `DataHoraSaida` datetime DEFAULT NULL,
  `ConfirmacaoEntrada` tinyint(1) DEFAULT NULL,
  `ConfirmacaoSaida` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `escalasguarda`
--

CREATE TABLE `escalasguarda` (
  `EscalaID` int(11) NOT NULL,
  `DiaSemana` date DEFAULT NULL,
  `HorarioInicio` time DEFAULT NULL,
  `HorarioFim` time DEFAULT NULL,
  `PatenteAutorizacao` varchar(20) DEFAULT NULL CHECK (`PatenteAutorizacao` in ('Sentinela','Comandante')),
  `Autorizado` tinyint(1) DEFAULT 0,
  `PatenteUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `trocashorario`
--

CREATE TABLE `trocashorario` (
  `TrocaID` int(11) NOT NULL,
  `SoldadoSolicitante` int(11) DEFAULT NULL,
  `SoldadoAceitante` int(11) DEFAULT NULL,
  `NovoHorarioInicio` time DEFAULT NULL,
  `NovoHorarioFim` time DEFAULT NULL,
  `Autorizado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `UsuarioID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Idade` int(11) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `NomeGuerra` varchar(50) DEFAULT NULL,
  `Patente` varchar(20) DEFAULT NULL CHECK (`Patente` in ('Sentinela','Comandante')),
  `UsuarioLogin` varchar(50) NOT NULL,
  `Senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`UsuarioID`, `Nome`, `Idade`, `DataNascimento`, `NomeGuerra`, `Patente`, `UsuarioLogin`, `Senha`) VALUES
(1, 'Kevin Santos', 19, '2003-10-26', 'Santos', 'sentinela', 'kevin', '1234');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `descanso`
--
ALTER TABLE `descanso`
  ADD PRIMARY KEY (`DescansoID`),
  ADD KEY `SoldadoID` (`SoldadoID`);

--
-- Índices de tabela `entradassaidas`
--
ALTER TABLE `entradassaidas`
  ADD PRIMARY KEY (`RegistroID`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- Índices de tabela `escalasguarda`
--
ALTER TABLE `escalasguarda`
  ADD PRIMARY KEY (`EscalaID`),
  ADD KEY `PatenteUsuario` (`PatenteUsuario`);

--
-- Índices de tabela `trocashorario`
--
ALTER TABLE `trocashorario`
  ADD PRIMARY KEY (`TrocaID`),
  ADD KEY `SoldadoSolicitante` (`SoldadoSolicitante`),
  ADD KEY `SoldadoAceitante` (`SoldadoAceitante`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioID`),
  ADD UNIQUE KEY `UsuarioLogin` (`UsuarioLogin`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `descanso`
--
ALTER TABLE `descanso`
  ADD CONSTRAINT `descanso_ibfk_1` FOREIGN KEY (`SoldadoID`) REFERENCES `usuarios` (`UsuarioID`);

--
-- Restrições para tabelas `entradassaidas`
--
ALTER TABLE `entradassaidas`
  ADD CONSTRAINT `entradassaidas_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`);

--
-- Restrições para tabelas `escalasguarda`
--
ALTER TABLE `escalasguarda`
  ADD CONSTRAINT `escalasguarda_ibfk_1` FOREIGN KEY (`PatenteUsuario`) REFERENCES `usuarios` (`UsuarioID`);

--
-- Restrições para tabelas `trocashorario`
--
ALTER TABLE `trocashorario`
  ADD CONSTRAINT `trocashorario_ibfk_1` FOREIGN KEY (`SoldadoSolicitante`) REFERENCES `usuarios` (`UsuarioID`),
  ADD CONSTRAINT `trocashorario_ibfk_2` FOREIGN KEY (`SoldadoAceitante`) REFERENCES `usuarios` (`UsuarioID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
