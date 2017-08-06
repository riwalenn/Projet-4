-- phpMyAdmin SQL Dump
-- version 4.4.13.1
-- http://www.phpmyadmin.net
--
-- Client :  riwalennrvfood.mysql.db
-- Généré le :  Ven 16 Juin 2017 à 14:41
-- Version du serveur :  5.6.34-log
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `riwalennrvfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `carte_bancaire`
--

CREATE TABLE IF NOT EXISTS `carte_bancaire` (
  `id_cb` smallint(3) NOT NULL,
  `id_client` smallint(3) NOT NULL,
  `numero_cb` varchar(45) DEFAULT NULL,
  `expiration_cb` date DEFAULT NULL,
  `nom_client` varchar(70) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `carte_bancaire`
--

INSERT INTO `carte_bancaire` (`id_cb`, `id_client`, `numero_cb`, `expiration_cb`, `nom_client`) VALUES
(1, 1, '1234567812345678', '2017-12-02', 'Robert'),
(2, 2, '1015568965873520', '2019-08-01', 'Bas');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` smallint(3) NOT NULL,
  `id_user` smallint(3) NOT NULL,
  `rue_client` longtext NOT NULL,
  `cp_client` int(11) NOT NULL,
  `ville` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`id_client`, `id_user`, `rue_client`, `cp_client`, `ville`) VALUES
(1, 4, '15 rue françois arago', 66000, 'Perpignan'),
(2, 5, '12 rue des maçons', 66000, 'Perpignan');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `id_commande` smallint(3) NOT NULL,
  `id_client` smallint(3) NOT NULL,
  `id_livreur` smallint(3) NOT NULL,
  `rue_commande` longtext NOT NULL,
  `cp_commande` int(11) NOT NULL,
  `ville_commande` varchar(255) NOT NULL,
  `statut_commande` varchar(70) NOT NULL,
  `total_commande` int(11) NOT NULL,
  `heure_commande` datetime(3) DEFAULT NULL,
  `heure_livraison` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`id_commande`, `id_client`, `id_livreur`, `rue_commande`, `cp_commande`, `ville_commande`, `statut_commande`, `total_commande`, `heure_commande`, `heure_livraison`) VALUES
(1, 1, 1, '15 rue françois arago', 66000, 'Perpignan', 'Traitée', 45, '2017-06-14 19:31:13.000', '2017-06-14 19:35:15.000'),
(2, 2, 1, '12 rue des maçons', 66000, 'Perpignan', 'En cours de livraison', 73, '2017-06-15 18:22:40.519', '2017-06-15 18:27:33.178'),
(3, 1, 1, '15 rue françois arago', 66000, 'Perpignan', 'En attente d''un livreur', 35, '2017-06-15 20:26:45.758', '2017-06-15 20:36:54.758');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `id_ligne_commande` smallint(3) NOT NULL,
  `id_produit` smallint(3) NOT NULL,
  `id_commande` smallint(3) NOT NULL,
  `quantité` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id_ligne_commande`, `id_produit`, `id_commande`, `quantité`) VALUES
(1, 1, 1, 1),
(2, 3, 1, 1),
(3, 5, 1, 1),
(4, 2, 2, 2),
(5, 3, 2, 1),
(6, 4, 2, 1),
(7, 5, 2, 1),
(8, 6, 2, 1),
(9, 1, 3, 2),
(10, 2, 3, 1),
(11, 3, 3, 1),
(12, 4, 3, 2),
(13, 5, 3, 2),
(14, 6, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livreurs`
--

CREATE TABLE IF NOT EXISTS `livreurs` (
  `id_livreur` smallint(3) NOT NULL,
  `id_user` smallint(3) NOT NULL,
  `latitude_zone` float unsigned DEFAULT NULL,
  `longitude_zone` float unsigned DEFAULT NULL,
  `rayon_zone` int(10) DEFAULT NULL,
  `latitude_livreur` float unsigned DEFAULT NULL,
  `longitude_livreur` float unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livreurs`
--

INSERT INTO `livreurs` (`id_livreur`, `id_user`, `latitude_zone`, `longitude_zone`, `rayon_zone`, `latitude_livreur`, `longitude_livreur`) VALUES
(1, 3, 42.6966, 2.89435, 500, 42.6948, 2.8915);

-- --------------------------------------------------------

--
-- Structure de la table `plat_jour`
--

CREATE TABLE IF NOT EXISTS `plat_jour` (
  `id_plat_jour` smallint(3) NOT NULL,
  `id_produit` smallint(3) NOT NULL,
  `date_pj` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `plat_jour`
--

INSERT INTO `plat_jour` (`id_plat_jour`, `id_produit`, `date_pj`) VALUES
(1, 1, '2017-06-16'),
(2, 4, '2017-06-16'),
(3, 5, '2017-06-16');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `id_produit` smallint(3) NOT NULL,
  `nom_produit` varchar(70) NOT NULL,
  `description_produit` longtext NOT NULL,
  `categorie_produit` varchar(45) NOT NULL,
  `prix_produit` decimal(8,0) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom_produit`, `description_produit`, `categorie_produit`, `prix_produit`) VALUES
(1, 'Carpaccio de st jacques', 'St Jacques découpées en fine lamelles avec une petite sauce vinaigrette maison.', 'Entrée', '8'),
(2, 'Roulade de saumon fumé aux asperges', 'Roulade de saumon fumé aux asperges, sauce aux crevettes et au chèvre frais.', 'Entrée', '10'),
(3, 'Parmigiana d''aubergines', 'Plat principal, d''origine sicilienne, la parmigiana d''aubergines est appréciée même par ceux qui n''aiment pas les aubergines !', 'Plat', '15'),
(4, 'Flan de poireaux', 'Ce flan revisité peut se déguster en famille, entre amis, ... ou en solo.', 'Plat', '18'),
(5, 'Tarte au citron meringuée', 'Recette traditionnelle', 'Dessert', '6'),
(6, 'Tiramisu', 'Recette originale au Marsala sec mélangé à un café corsé !', 'Dessert', '5');

-- --------------------------------------------------------

--
-- Structure de la table `stock_livreur`
--

CREATE TABLE IF NOT EXISTS `stock_livreur` (
  `id_stock_livreur` smallint(3) NOT NULL,
  `id_produit` smallint(3) NOT NULL,
  `id_livreur` smallint(3) NOT NULL,
  `quantité` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stock_livreur`
--

INSERT INTO `stock_livreur` (`id_stock_livreur`, `id_produit`, `id_livreur`, `quantité`) VALUES
(1, 1, 1, 4),
(2, 2, 1, 5),
(3, 3, 1, 4),
(4, 4, 1, 5),
(5, 5, 1, 4),
(6, 6, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_user` smallint(3) NOT NULL,
  `login` varchar(70) NOT NULL,
  `nom` varchar(70) NOT NULL,
  `prenom` varchar(70) NOT NULL,
  `telephone` int(10) unsigned zerofill NOT NULL,
  `role` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_user`, `login`, `nom`, `prenom`, `telephone`, `role`, `password`) VALUES
(1, 'expressFood_Admin', 'Bas', 'Riwalenn', 0635119038, 'administrateur', '24VGmfrVV6rY2'),
(2, 'expressFood_sc', 'Bonet', 'Joseph', 0158116845, 'service client', '55Y0aX41Yibv6'),
(3, 'expressFood_livreurJG', 'Gabay', 'Jeremy', 0611856896, 'livreur', '98ywWGi.Qi5ro'),
(4, 'rob_colmas', 'Colmas', 'Robert', 0548598512, 'client', '12q5MsnXdapMs'),
(5, 'mistigri', 'Bas', 'Riwalenn', 0495501165, 'client', 'ywWGi.Qi');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `carte_bancaire`
--
ALTER TABLE `carte_bancaire`
  ADD PRIMARY KEY (`id_cb`,`id_client`),
  ADD KEY `fk_carte_bancaire_clients1_idx` (`id_client`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`,`id_user`),
  ADD KEY `fk_clients_utilisateurs1_idx` (`id_user`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_commande`,`id_client`,`id_livreur`),
  ADD KEY `fk_commandes_clients1_idx` (`id_client`),
  ADD KEY `fk_commandes_livreurs1_idx` (`id_livreur`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id_ligne_commande`,`id_produit`,`id_commande`),
  ADD KEY `fk_ligne_commande_produits1_idx` (`id_produit`),
  ADD KEY `fk_ligne_commande_commandes1_idx` (`id_commande`);

--
-- Index pour la table `livreurs`
--
ALTER TABLE `livreurs`
  ADD PRIMARY KEY (`id_livreur`,`id_user`),
  ADD KEY `fk_livreurs_utilisateurs1_idx` (`id_user`);

--
-- Index pour la table `plat_jour`
--
ALTER TABLE `plat_jour`
  ADD PRIMARY KEY (`id_plat_jour`,`id_produit`),
  ADD KEY `fk_plat_jour_produits1_idx` (`id_produit`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`);

--
-- Index pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD PRIMARY KEY (`id_stock_livreur`,`id_produit`,`id_livreur`),
  ADD KEY `fk_stock_livreur_livreurs1_idx` (`id_livreur`),
  ADD KEY `fk_stock_livreur_produits1_idx` (`id_produit`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `carte_bancaire`
--
ALTER TABLE `carte_bancaire`
  MODIFY `id_cb` smallint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `plat_jour`
--
ALTER TABLE `plat_jour`
  MODIFY `id_plat_jour` smallint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` smallint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  MODIFY `id_stock_livreur` smallint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `carte_bancaire`
--
ALTER TABLE `carte_bancaire`
  ADD CONSTRAINT `fk_carte_bancaire_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_utilisateurs` FOREIGN KEY (`id_user`) REFERENCES `utilisateurs` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `fk_commandes_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commandes_livreurs1` FOREIGN KEY (`id_livreur`) REFERENCES `livreurs` (`id_livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_commandes1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligne_commande_produits1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livreurs`
--
ALTER TABLE `livreurs`
  ADD CONSTRAINT `fk_livreurs_utilisateurs` FOREIGN KEY (`id_user`) REFERENCES `utilisateurs` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plat_jour`
--
ALTER TABLE `plat_jour`
  ADD CONSTRAINT `fk_plat_jour_produits1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `fk_stock_livreur_livreurs1` FOREIGN KEY (`id_livreur`) REFERENCES `livreurs` (`id_livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stock_livreur_produits1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
