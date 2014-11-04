-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 04-Nov-2014 às 19:40
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tweeter`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE IF NOT EXISTS `favoritos` (
  `codigo_tweet` int(11) NOT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE IF NOT EXISTS `mensagens` (
`codigo` int(11) NOT NULL,
  `texto` text,
  `imagem` varchar(50) DEFAULT NULL,
  `data_hora_envio` timestamp NULL DEFAULT NULL,
  `remetente` int(11) NOT NULL,
  `destinatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE IF NOT EXISTS `respostas` (
`codigo` int(11) NOT NULL,
  `texto` varchar(140) DEFAULT NULL,
  `imagem` varchar(50) DEFAULT NULL,
  `data_hora_postagem` timestamp NULL DEFAULT NULL,
  `codigo_tweet` int(11) NOT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `retweets`
--

CREATE TABLE IF NOT EXISTS `retweets` (
  `data_hora_postagem` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `codigo_tweet` int(11) NOT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguidores`
--

CREATE TABLE IF NOT EXISTS `seguidores` (
  `codigo_seguidor` int(11) NOT NULL,
  `codigo_seguido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `seguidores`
--

INSERT INTO `seguidores` (`codigo_seguidor`, `codigo_seguido`) VALUES
(3, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tweets`
--

CREATE TABLE IF NOT EXISTS `tweets` (
`codigo` int(11) NOT NULL,
  `texto` varchar(140) DEFAULT NULL,
  `data_hora_postagem` timestamp NULL DEFAULT NULL,
  `imagem` varchar(50) DEFAULT NULL,
  `codigo_usuario` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tweets`
--

INSERT INTO `tweets` (`codigo`, `texto`, `data_hora_postagem`, `imagem`, `codigo_usuario`) VALUES
(1, 'Teste novo Tweet', '2014-11-04 09:04:08', NULL, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`codigo` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `descricao` text,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`codigo`, `nome`, `login`, `senha`, `email`, `data_cadastro`, `foto`, `descricao`, `imagem`) VALUES
(1, 'José da Silva', 'zedasilva', '123456', 'zedasilva@gmail.com', NULL, NULL, NULL, ''),
(2, 'Fulano de Tal', 'fulanodetal', '123456', 'fulano@gmail.com', NULL, NULL, 'blá, blá, blá...', ''),
(3, 'João dos Santos', 'jsantos', '12345678', 'dossantos@gmail.com', NULL, NULL, NULL, ''),
(4, 'Teste', 'TesteTeste', 'teste', 'teste@teste.com.br', NULL, NULL, 'Um simples teste', ''),
(5, 'Amilton Junior', 'amilt0n', '123123', 'amiltonbjr@gmail.com', NULL, NULL, 'Um cara bacana', 'http://toscochanchada.com.br/wp-content/uploads/2010/01/caco.jpg'),
(6, 'Reginaldo', 'reginaldoifc', '123123', 'reginaldo@ifc-camboriu.edu.br', NULL, NULL, 'Professor Reginaldo', 'http://frameworksphp.com.br/images/reginaldo.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favoritos`
--
ALTER TABLE `favoritos`
 ADD PRIMARY KEY (`codigo_tweet`,`codigo_usuario`), ADD KEY `fk_favoritos_tweets1_idx` (`codigo_tweet`), ADD KEY `fk_favoritos_usuarios1` (`codigo_usuario`);

--
-- Indexes for table `mensagens`
--
ALTER TABLE `mensagens`
 ADD PRIMARY KEY (`codigo`), ADD KEY `fk_mensagens_usuarios1_idx` (`remetente`), ADD KEY `fk_mensagens_usuarios2_idx` (`destinatario`);

--
-- Indexes for table `respostas`
--
ALTER TABLE `respostas`
 ADD PRIMARY KEY (`codigo`), ADD KEY `fk_respostas_tweets1_idx` (`codigo_tweet`), ADD KEY `fk_respostas_usuarios1_idx` (`codigo_usuario`);

--
-- Indexes for table `retweets`
--
ALTER TABLE `retweets`
 ADD PRIMARY KEY (`codigo_tweet`,`codigo_usuario`), ADD KEY `fk_retweets_usuarios1_idx` (`codigo_usuario`);

--
-- Indexes for table `seguidores`
--
ALTER TABLE `seguidores`
 ADD PRIMARY KEY (`codigo_seguidor`,`codigo_seguido`), ADD KEY `codigo_seguido` (`codigo_seguido`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
 ADD PRIMARY KEY (`codigo`), ADD KEY `fk_tweets_usuarios_idx` (`codigo_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mensagens`
--
ALTER TABLE `mensagens`
MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
ADD CONSTRAINT `fk_favoritos_tweets1` FOREIGN KEY (`codigo_tweet`) REFERENCES `tweets` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_favoritos_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `mensagens`
--
ALTER TABLE `mensagens`
ADD CONSTRAINT `fk_mensagens_usuarios1` FOREIGN KEY (`remetente`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_mensagens_usuarios2` FOREIGN KEY (`destinatario`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `respostas`
--
ALTER TABLE `respostas`
ADD CONSTRAINT `fk_respostas_tweets1` FOREIGN KEY (`codigo_tweet`) REFERENCES `tweets` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_respostas_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `retweets`
--
ALTER TABLE `retweets`
ADD CONSTRAINT `fk_retweets_tweets1` FOREIGN KEY (`codigo_tweet`) REFERENCES `tweets` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_retweets_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seguidores`
--
ALTER TABLE `seguidores`
ADD CONSTRAINT `seguidores_ibfk_1` FOREIGN KEY (`codigo_seguidor`) REFERENCES `usuarios` (`codigo`),
ADD CONSTRAINT `seguidores_ibfk_2` FOREIGN KEY (`codigo_seguido`) REFERENCES `usuarios` (`codigo`);

--
-- Limitadores para a tabela `tweets`
--
ALTER TABLE `tweets`
ADD CONSTRAINT `fk_tweets_usuarios` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
