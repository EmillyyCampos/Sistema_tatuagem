-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/10/2026 às 06:39
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
-- Banco de dados: `estudio_tatuagem_atualizado_final`
--
CREATE DATABASE IF NOT EXISTS `estudio_tatuagem_atualizado_final` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `estudio_tatuagem_atualizado_final`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `idagendamento` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idtatuador` int(11) NOT NULL,
  `dataagendamento` date NOT NULL,
  `horaagendamento` time NOT NULL,
  `descricaotatuagem` text DEFAULT NULL,
  `desenhoaprovado` varchar(255) DEFAULT NULL,
  `valortatuagem` decimal(10,2) DEFAULT NULL,
  `status` enum('pendente','confirmado','concluido','cancelado') NOT NULL DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agendamento`
--

INSERT INTO `agendamento` (`idagendamento`, `idcliente`, `idtatuador`, `dataagendamento`, `horaagendamento`, `descricaotatuagem`, `desenhoaprovado`, `valortatuagem`, `status`) VALUES
(2, 1, 2, '2026-11-12', '16:00:00', 'Pantera com detalhes em azul', '2_pantera.jfif', 480.00, 'confirmado'),
(3, 2, 2, '2026-10-20', '15:30:00', 'Fênix nas costas', NULL, 450.00, 'pendente'),
(6, 1, 3, '2026-10-20', '11:30:00', 'Fine line no pulso', '6_fineline.jpeg', 150.00, 'confirmado'),
(7, 5, 4, '2026-12-24', '21:30:00', 'Dragão chines no braço ', '7_dragao chines.jfif', NULL, 'pendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `datacadastro` date DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nome`, `cpf`, `telefone`, `datacadastro`, `cidade`, `uf`) VALUES
(1, 'Ana Silva', '44444444444', '11988880001', '2024-01-15', 'São Paulo', 'SP'),
(2, 'Bruno Costa', '55555555555', '31988880002', '2026-10-13', 'Belo Horizonte', 'MG'),
(5, 'Carlos Oliveira', '6911134421', '11928453621', '2026-09-23', 'Guapituba', 'SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estilo`
--

CREATE TABLE `estilo` (
  `idestilo` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estilo`
--

INSERT INTO `estilo` (`idestilo`, `descricao`) VALUES
(1, 'Blackwork'),
(2, 'Aquarela'),
(3, 'Realismo'),
(4, 'Old School'),
(6, 'Pontilhismo'),
(7, 'Oriental');

-- --------------------------------------------------------

--
-- Estrutura para tabela `senioridade`
--

CREATE TABLE `senioridade` (
  `idsenioridade` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `senioridade`
--

INSERT INTO `senioridade` (`idsenioridade`, `nome`) VALUES
(1, 'Júnior'),
(2, 'Plenum'),
(3, 'Sênior'),
(4, 'Executivo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tatuador`
--

CREATE TABLE `tatuador` (
  `idtatuador` int(11) NOT NULL,
  `nometatuador` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `datacontratacao` date DEFAULT NULL,
  `idsenioridade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tatuador`
--

INSERT INTO `tatuador` (`idtatuador`, `nometatuador`, `cpf`, `email`, `telefone`, `datacontratacao`, `idsenioridade`) VALUES
(1, 'Lucas Mendes', '11111111111', 'lucaaasss@estudio.com', '11999990001', '2026-09-30', 3),
(2, 'Carla Souza', '22222222222', 'carla@estudio.com', '11999990002', '2026-10-10', 2),
(3, 'Pedro Lima', '33333333333', 'pedro@estudio.com', '11999990003', '2024-01-10', 1),
(4, 'Rosa Oliveira', '44444444444', 'rosaaa@estudio.com', '11999990004', '2026-10-10', 4),
(5, 'Olivia Castro', '55555555555', 'olivcastro@estudio.com', '11999990005', '0000-00-00', 3),
(7, 'Ermando Silva', '66666666666', 'ermando@estudio.com', '11999990006', '2026-10-10', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tatuador_estilo`
--

CREATE TABLE `tatuador_estilo` (
  `idtatuador` int(11) NOT NULL,
  `idestilo` int(11) NOT NULL,
  `dataestilo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tatuador_estilo`
--

INSERT INTO `tatuador_estilo` (`idtatuador`, `idestilo`, `dataestilo`) VALUES
(1, 1, '2020-03-01'),
(1, 3, '2021-05-10'),
(2, 2, '2026-10-10'),
(2, 3, '2026-10-10'),
(3, 2, '2026-10-10'),
(3, 4, '2026-10-10'),
(4, 1, '2026-10-10'),
(4, 6, '2026-10-10'),
(5, 3, '2026-10-10'),
(5, 4, '2026-10-10'),
(7, 1, '2026-10-10'),
(7, 6, '2026-10-10'),
(7, 7, '2026-10-10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('admin','funcionario','cliente') NOT NULL DEFAULT 'funcionario',
  `idcliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `email`, `senha`, `tipo`, `idcliente`) VALUES
(1, 'Victor', 'victor@usuario.com', '$2b$12$eeE8aa2uwC1HKOGwWb8GZOMMmj.3WtDT9ANfdxpjTm46sqxnP5iSa', 'funcionario', NULL),
(2, 'Marisa Carvalho', 'maricarvalho@usuario.com', '$2b$12$akc3XlSowbRQ8rKNUUHvVeCyj5f0UUXtQz3qEY3Kak0aTeGLKzpMS', 'funcionario', NULL),
(3, 'Administrador', 'admin@estudio.com', '$2b$12$sqheh93tu2pm8dVkJPs2U.xHNh9hl3e6XqDQA1QA3g/V9LbdL3S9.', 'admin', NULL),
(10, 'Maria Betania', 'betania@estudio.com', '$2b$12$d3K15IcfUq.EU.OTZgUMxeci8Y89AJ3tSipFI3LVwATxnn.TgCsHa', 'funcionario', NULL),
(11, 'Henrique Alves', 'henrique@estudio.com', '$2b$12$YVUujuxDdQjRp3scBAbBjejNZ2irJpLFrhS8vjzd4J/PrD.w.3rGa', 'funcionario', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`idagendamento`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idtatuador` (`idtatuador`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `estilo`
--
ALTER TABLE `estilo`
  ADD PRIMARY KEY (`idestilo`);

--
-- Índices de tabela `senioridade`
--
ALTER TABLE `senioridade`
  ADD PRIMARY KEY (`idsenioridade`);

--
-- Índices de tabela `tatuador`
--
ALTER TABLE `tatuador`
  ADD PRIMARY KEY (`idtatuador`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `idsenioridade` (`idsenioridade`);

--
-- Índices de tabela `tatuador_estilo`
--
ALTER TABLE `tatuador_estilo`
  ADD PRIMARY KEY (`idtatuador`,`idestilo`),
  ADD KEY `idestilo` (`idestilo`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idcliente` (`idcliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `idagendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `estilo`
--
ALTER TABLE `estilo`
  MODIFY `idestilo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `senioridade`
--
ALTER TABLE `senioridade`
  MODIFY `idsenioridade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tatuador`
--
ALTER TABLE `tatuador`
  MODIFY `idtatuador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`idtatuador`) REFERENCES `tatuador` (`idtatuador`);

--
-- Restrições para tabelas `tatuador`
--
ALTER TABLE `tatuador`
  ADD CONSTRAINT `tatuador_ibfk_1` FOREIGN KEY (`idsenioridade`) REFERENCES `senioridade` (`idsenioridade`);

--
-- Restrições para tabelas `tatuador_estilo`
--
ALTER TABLE `tatuador_estilo`
  ADD CONSTRAINT `tatuador_estilo_ibfk_1` FOREIGN KEY (`idtatuador`) REFERENCES `tatuador` (`idtatuador`),
  ADD CONSTRAINT `tatuador_estilo_ibfk_2` FOREIGN KEY (`idestilo`) REFERENCES `estilo` (`idestilo`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;