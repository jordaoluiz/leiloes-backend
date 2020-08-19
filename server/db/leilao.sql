-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Ago-2020 às 21:29
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leilao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `lances`
--

CREATE TABLE `lances` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `valorLance` varchar(40) NOT NULL,
  `nomeItem` varchar(40) NOT NULL,
  `idLeilao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lances`
--

INSERT INTO `lances` (`id`, `nome`, `valorLance`, `nomeItem`, `idLeilao`) VALUES
(1, 'jordao', '90212231', 'JetSki Sea Doo 2020 - Venom', 5),
(2, 'jordao', '30000', 'JetSki Sea Doo 2020 - Venom', 5),
(3, 'Ana', '40000', 'JetSki Sea Doo 2020 - Venom', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `leiloes`
--

CREATE TABLE `leiloes` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `valor` float NOT NULL,
  `ultLance` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `leiloes`
--

INSERT INTO `leiloes` (`id`, `nome`, `valor`, `ultLance`) VALUES
(1, 'NEW CIVIC 2018', 50000, '0'),
(2, 'NEW CIVIC 2020', 70000, '0'),
(3, 'jetski sea doo 2018', 30000, '3000'),
(4, 'JetSki Sea Doo 2015 - Venom', 21000, '0'),
(5, 'JetSki Sea Doo 2020 - Venom', 21000, '40000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `idade` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `idade`) VALUES
(1, 'jordao', 21),
(2, 'jordao', 21),
(5, 'Ana Carolina', 21),
(6, 'Junior Silva', 72),
(7, 'Luiz Jordão', 21),
(8, 'jordao', 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lances`
--
ALTER TABLE `lances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLeilao` (`idLeilao`);

--
-- Indexes for table `leiloes`
--
ALTER TABLE `leiloes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lances`
--
ALTER TABLE `lances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leiloes`
--
ALTER TABLE `leiloes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `lances`
--
ALTER TABLE `lances`
  ADD CONSTRAINT `lances_ibfk_1` FOREIGN KEY (`idLeilao`) REFERENCES `leiloes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
