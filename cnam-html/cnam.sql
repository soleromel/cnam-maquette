-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 16 Janvier 2015 à 16:19
-- Version du serveur :  5.6.20
-- Version de PHP :  5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `cnam`
--

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
`id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `codepostal` int(5) NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `motcles` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
`id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `chemin` varchar(255) NOT NULL,
  `verif` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `module`
--

INSERT INTO `module` (`id`, `nom`, `chemin`, `verif`) VALUES
(1, 'user', 'mod_user', 1),
(2, 'menu', 'mod_menu', 1);

-- --------------------------------------------------------

--
-- Structure de la table `motcle`
--

CREATE TABLE IF NOT EXISTS `motcle` (
`id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `motcle`
--

INSERT INTO `motcle` (`id`, `nom`) VALUES
(4, 'château'),
(2, 'église'),
(1, 'gare'),
(3, 'monument historique'),
(5, 'villa');

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
`id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `modules` varchar(255) NOT NULL,
  `composants` varchar(255) NOT NULL,
  `template` int(11) NOT NULL,
  `pageParente` int(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id`, `nom`, `titre`, `modules`, `composants`, `template`, `pageParente`) VALUES
(1, 'index', 'la page d''accueil', '1,2', '', 1, NULL),
(2, 'profil', 'votre profil utilisateur', '', '1', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
`id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `chemin` varchar(255) NOT NULL,
  `verif` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `template`
--

INSERT INTO `template` (`id`, `nom`, `chemin`, `verif`) VALUES
(1, 'defaut', '/templates/defaut/index.php', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `motdepasse` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `quidConnexion` varchar(255) DEFAULT NULL,
  `droits` int(3) NOT NULL DEFAULT '2'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `login`, `motdepasse`, `nom`, `quidConnexion`, `droits`) VALUES
(1, 'admin', 'cnam', 'administrateur', 'NULL', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `image`
--
ALTER TABLE `image`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `motcle`
--
ALTER TABLE `motcle`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `template`
--
ALTER TABLE `template`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`), ADD KEY `Id` (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `motcle`
--
ALTER TABLE `motcle`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `template`
--
ALTER TABLE `template`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
