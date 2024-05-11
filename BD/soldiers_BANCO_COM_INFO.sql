-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/05/2024 às 22:01
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

--
-- Despejando dados para a tabela `escala_guarda`
--

INSERT INTO `escala_guarda` (`id`, `id_usuario`, `tipo_escala`, `corte_cabelo_conformidade`, `identificacao_militar_conformidade`) VALUES
(118, 24, 'Vermelha', 1, 0),
(119, 26, 'Vermelha', 1, 1),
(120, 36, 'Vermelha', 1, 0),
(121, 35, 'Vermelha', 1, 1),
(122, 34, 'Cinza', 0, 1),
(123, 33, 'Cinza', 0, 0),
(124, 32, 'Vermelha', 1, 0),
(125, 27, 'Vermelha', 1, 0),
(126, 28, 'Vermelha', 1, 0),
(127, 1, 'Cinza', 1, 1),
(128, 2, 'Cinza', 1, 1),
(129, 3, 'Cinza', 1, 1),
(130, 4, 'Cinza', 1, 1),
(131, 5, 'Cinza', 1, 1),
(132, 6, 'Cinza', 1, 1),
(133, 7, 'Cinza', 1, 1),
(134, 8, 'Cinza', 1, 1),
(135, 9, 'Cinza', 1, 1),
(136, 10, 'Cinza', 1, 1),
(137, 11, 'Cinza', 1, 1),
(138, 12, 'Vermelha', 1, 1),
(139, 13, 'Cinza', 0, 1),
(140, 14, 'Cinza', 1, 1),
(141, 15, 'Cinza', 1, 1),
(142, 16, 'Cinza', 1, 1),
(143, 17, 'Vermelha', 1, 1),
(144, 18, 'Cinza', 0, 1),
(145, 19, 'Cinza', 0, 1),
(146, 20, 'Cinza', 0, 1),
(147, 21, 'Cinza', 1, 1),
(148, 22, 'Vermelha', 1, 0),
(149, 39, 'Cinza', 1, 1);

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

--
-- Despejando dados para a tabela `registro_entrada_saida`
--

INSERT INTO `registro_entrada_saida` (`id_registro`, `id_usuario`, `data_hora_entrada`, `data_hora_saida`) VALUES
(24, 24, '2024-03-05 14:51:27', '2024-03-05 14:51:32'),
(25, 25, '2024-03-05 14:27:33', '2024-03-05 14:27:46'),
(26, 26, '2024-03-05 14:55:23', '2024-03-05 14:55:34'),
(27, 27, '2024-03-08 13:52:34', '2024-03-08 13:53:10'),
(29, 29, '2024-03-22 13:48:32', '2024-03-22 13:48:37'),
(31, 31, '2024-03-27 14:47:05', '2024-03-27 14:47:17'),
(43, 43, '2024-05-11 11:46:01', '2024-05-11 11:46:14');

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

--
-- Despejando dados para a tabela `solicitar_observacao`
--

INSERT INTO `solicitar_observacao` (`id_observacao`, `id_usuario_solicitante`, `data_solicitacao`, `status_solicitacao`, `texto`) VALUES
(111, 43, '2024-05-11 14:01:52', 'Aceita', 'teste'),
(112, 43, '2024-05-11 14:38:21', 'pendente', 'A vida é uma jornada cheia de altos e baixos. Em meio às adversidades, encontramos nossa força interior. Cada desafio molda quem somos. Nunca desista de seus sonhos, pois é neles que encontramos a verdadeira essência da vida'),
(113, 44, '2024-05-11 14:58:57', 'Aceita', 'testando1234');

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
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nm_usuario`, `cd_idade`, `dt_dataNascimento`, `nm_guerra`, `nm_patente`, `nm_usuarioLogin`, `cd_senha`) VALUES
(1, 'Sentinela1', 25, '1999-01-01', 'Guerra1', 'Comandante', 'login1', 'senha1'),
(2, 'Sentinela2', 26, '1998-02-02', 'Guerra2', 'Sentinela', 'login2', 'senha2'),
(3, 'Sentinela3', 27, '1997-03-03', 'Guerra3', 'Comandante', 'login3', 'senha3'),
(4, 'Sentinela4', 28, '1996-04-04', 'Guerra4', 'Sentinela', 'login4', 'senha4'),
(5, 'Sentinela5', 29, '1995-05-05', 'Guerra5', 'Comandante', 'login5', 'senha5'),
(6, 'Sentinela6', 30, '1994-06-06', 'Guerra6', 'Sentinela', 'login6', 'senha6'),
(7, 'Sentinela7', 31, '1993-07-07', 'Guerra7', 'Comandante', 'login7', 'senha7'),
(8, 'Sentinela8', 32, '1992-08-08', 'Guerra8', 'Sentinela', 'login8', 'senha8'),
(9, 'Sentinela9', 33, '1991-09-09', 'Guerra9', 'Comandante', 'login9', 'senha9'),
(10, 'Sentinela10', 34, '1990-10-10', 'Guerra10', 'Sentinela', 'login10', 'senha10'),
(11, 'Sentinela11', 35, '1989-11-11', 'Guerra11', 'Comandante', 'login11', 'senha11'),
(12, 'Sentinela12', 36, '1988-12-12', 'Guerra12', 'Sentinela', 'login12', 'senha12'),
(13, 'Sentinela13', 37, '1987-01-01', 'Guerra13', 'Comandante', 'login13', 'senha13'),
(14, 'Sentinela14', 38, '1986-02-02', 'Guerra14', 'Sentinela', 'login14', 'senha14'),
(15, 'Sentinela15', 39, '1985-03-03', 'Guerra15', 'Comandante', 'login15', 'senha15'),
(16, 'Sentinela16', 40, '1984-04-04', 'Guerra16', 'Sentinela', 'login16', 'senha16'),
(17, 'Sentinela17', 41, '1983-05-05', 'Guerra17', 'Comandante', 'login17', 'senha17'),
(18, 'Sentinela18', 42, '1982-06-06', 'Guerra18', 'Sentinela', 'login18', 'senha18'),
(19, 'Sentinela19', 43, '1981-07-07', 'Guerra19', 'Comandante', 'login19', 'senha19'),
(20, 'Sentinela20', 44, '1980-08-08', 'Guerra20', 'Sentinela', 'login20', 'senha20'),
(21, 'Sentinela21', 45, '1979-09-09', 'Guerra21', 'Comandante', 'login21', 'senha21'),
(22, 'Sentinela22', 46, '1978-10-10', 'Guerra22', 'Sentinela', 'login22', 'senha22'),
(24, '13', 13, '2024-03-14', '13', 'Comandante', '13', '13'),
(25, '14', 14, '2003-12-13', '14', 'Sentinela', '14', '14'),
(26, '15', 15, '2003-06-15', '15', 'Sentinela', '15', '15'),
(27, 'Marcelo', 18, '2003-06-20', 'Marcelo', 'Sentinela', 'Marcelo', '123'),
(28, '2', 32, '2222-02-22', '2', 'Sentinela', '2', '2'),
(29, 'Cabo Daciolo', 19, '2024-03-20', 'daciolo', 'Cabo', 'daciolo', 'daciolo'),
(30, 'jorge', 19, '2024-03-05', 'jorge', 'Cabo', 'jorge', 'a4a72c0ab0deca9472720ab503cecc45'),
(31, 'salgado', 22, '2024-03-04', 'salgado', 'Sentinela', 'salgado', 'c4ca4238a0b923820dcc509a6f75849b'),
(32, 'francielly', 12, '2024-03-05', 'francielly', 'Sentinela', 'francielly', ''),
(33, 'gustavo', 12, '2024-03-11', 'gustavo', 'Comandante', 'gustavo', '4c96f8324e3ba54a99e78249b95daa30'),
(34, 'andre', 13, '2024-03-12', 'andre', 'Sentinela', 'andre', '19984dcaea13176bbb694f62ba6b5b35'),
(35, 'davi', 13, '2024-03-03', 'davi', 'Sentinela', 'davi', 'e185f02e8231a1d57f8a90a54502f545'),
(36, 'matheus', 13, '2024-03-03', 'matheus', 'Sentinela', 'matheus', '45339359513f09155110f63f7ca91c3e'),
(37, 'Kevin', 18, '2024-04-01', 'Kevin', 'Cabo', 'Kevin', '202cb962ac59075b964b07152d234b70'),
(38, 'leandro', 20, '2024-04-01', 'LEandro', 'Cabo', 'Leandro', '202cb962ac59075b964b07152d234b70'),
(39, 'Raynara', 20, '2024-04-02', 'ray', 'Sentinela', 'ray', '202cb962ac59075b964b07152d234b70'),
(40, '69', 70, '2024-05-06', '69', 'Cabo', '6969', '3a027e567eb20d2ce418f5fb1d620aa7'),
(41, '79', 79, '2024-05-07', '79', 'Cabo', '79', 'd1fe173d08e959397adf34b1d77e88d7'),
(42, '80', 80, '2024-05-14', '80', 'Sentinela', '80', 'f033ab37c30201f73f142449d037028d'),
(43, '81', 81, '2024-05-06', '81', 'Comandante', '81', '43ec517d68b6edd3015b3edc9a11367b'),
(44, 'Jesus', 13, '2024-05-07', 'Jesus', 'Sentinela', 'Jesus', 'e9829608dd90ff6b8bf7cb50746eae78'),
(45, 'Deus', 61, '2024-04-30', 'Deus', 'Cabo', 'Deus', '3281d64d71abcf40e862001e6a5e7c58'),
(46, 'Anos', 12, '2012-01-10', 'Anos', 'Comandante', 'Anos', '588db52f05fca0101d7664f84dc0d285'),
(47, 'sepriano', -114, '2138-01-13', 'sepriano', 'Cabo', 'sepriano', '0d91fb12da2d87e1a0bab2af083ec98a'),
(48, 'xv', 18, '2016-01-13', 'xv', 'Comandante', 'xv', '22654d2ed4c921c7bceb22ce9f9dc892'),
(49, 'jv', 17, '2024-05-07', 'jv', 'Comandante', 'jv', '6af057782fede733cab8d3e0bccd8737'),
(50, 'Jica', 0, '2024-05-01', 'Jica', 'Cabo', 'Jica', '3eb682a8ca66f10d528521db4c0d71df'),
(51, 'xina', 0, '2024-04-29', 'xina', 'Cabo', 'xina', '6c09c2d00b206af4092114e9a6572673'),
(52, 'xinaum', 0, '2024-05-01', 'xinaum', 'Comandante', 'xinaum', '4adb6b64c5a1ba25276d4bb7b7d0ec7c'),
(53, 'a1', 0, '2024-05-06', 'a1', 'Cabo', 'a1', '8a8bb7cd343aa2ad99b7d762030857a2'),
(54, 'xio', 0, '2024-05-07', 'xio', 'Cabo', 'xio', '5fb0bc4e7d110594272e4ea097d8c28d'),
(55, 'xk', 0, '2024-05-01', 'xk', 'Cabo', 'xk', 'a2d8fced03cb2e20ef8e1226935c9c92'),
(56, 'xiv', 0, '2024-04-29', 'xiv', 'Cabo', 'xiv', '68cfb3fc398195d0127375545ee99f11'),
(57, 'xva', 0, '2024-04-30', 'xva', 'Cabo', 'xva', '344a0ca4cfe46e81a8e323cb84194502');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de tabela `registro_entrada_saida`
--
ALTER TABLE `registro_entrada_saida`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `solicitar_observacao`
--
ALTER TABLE `solicitar_observacao`
  MODIFY `id_observacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
