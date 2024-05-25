-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/05/2024 às 06:42
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
-- Banco de dados: `soldiers`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `escala_guarda`
--

CREATE TABLE `escala_guarda` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo_escala` varchar(20) NOT NULL,
  `corte_cabelo_conformidade` tinyint(1) DEFAULT NULL,
  `identificacao_militar_conformidade` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_escala_guarda`
--

CREATE TABLE `historico_escala_guarda` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_hora_entrada` datetime DEFAULT NULL,
  `data_hora_saida` datetime DEFAULT NULL,
  `tipo_escala` varchar(50) DEFAULT NULL,
  `corte_cabelo_conformidade` tinyint(1) DEFAULT NULL,
  `identificacao_militar_conformidade` tinyint(1) DEFAULT NULL,
  `data_remocao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `registro_entrada_saida`
--

CREATE TABLE `registro_entrada_saida` (
  `id_registro` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_hora_entrada` datetime DEFAULT NULL,
  `data_hora_saida` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitar_observacao`
--

CREATE TABLE `solicitar_observacao` (
  `id_observacao` int(11) NOT NULL,
  `id_usuario_solicitante` int(11) DEFAULT NULL,
  `data_solicitacao` datetime DEFAULT NULL,
  `status_solicitacao` varchar(20) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
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
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `escala_guarda`
--
ALTER TABLE `escala_guarda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `historico_escala_guarda`
--
ALTER TABLE `historico_escala_guarda`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `solicitar_observacao`
--
ALTER TABLE `solicitar_observacao`
  ADD PRIMARY KEY (`id_observacao`),
  ADD KEY `id_usuario_solicitante` (`id_usuario_solicitante`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `escala_guarda`
--
ALTER TABLE `escala_guarda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de tabela `historico_escala_guarda`
--
ALTER TABLE `historico_escala_guarda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `solicitar_observacao`
--
ALTER TABLE `solicitar_observacao`
  MODIFY `id_observacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `escala_guarda`
--
ALTER TABLE `escala_guarda`
  ADD CONSTRAINT `escala_guarda_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  ADD CONSTRAINT `registro_entrada_saida_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
