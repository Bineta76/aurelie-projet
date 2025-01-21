-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 21 jan. 2025 à 08:23
-- Version du serveur : 10.11.6-MariaDB-0+deb12u1
-- Version de PHP : 8.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `healthnorth`
--

-- --------------------------------------------------------

--
-- Structure de la table `cabinet médical`
--

CREATE TABLE `cabinet médical` (
  `id_CabinetMedical` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cabinet médical`
--

INSERT INTO `cabinet médical` (`id_CabinetMedical`, `nom`, `adresse`, `ville`, `telephone`) VALUES
(1, 'Cabinet Nord Santé', '123 rue de Lille', 'Lille', '0320001111'),
(2, 'Centre Médical Sud', '45 avenue de Paris', 'Paris', '0142002222');

-- --------------------------------------------------------

--
-- Structure de la table `examen`
--

CREATE TABLE `examen` (
  `id_examen` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `examen`
--

INSERT INTO `examen` (`id_examen`, `nom`, `description`) VALUES
(1, 'IRM', 'Imagerie par Résonance Magnétique'),
(2, 'Scanner', 'Tomodensitométrie'),
(3, 'Radio', 'Radiographie standard');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `id_medecin` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `specialite` varchar(100) DEFAULT NULL,
  `id_CabinetMedical` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id_medecin`, `nom`, `specialite`, `id_CabinetMedical`) VALUES
(1, 'Dr Jean Dupont', 'Cardiologie', 1),
(2, 'Dr Marie Curie', 'Radiologie', 1),
(3, 'Dr Louis Pasteur', 'Neurologie', 2),
(4, 'Dr Jean Dupont', 'Cardiologie', 1),
(5, 'Dr Marie Curie', 'Radiologie', 1),
(6, 'Dr Louis Pasteur', 'Neurologie', 2);

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `idpatient` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `numerodesecuritesociale` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`idpatient`, `nom`, `prenom`, `login`, `mdp`, `email`, `numerodesecuritesociale`) VALUES
(1, 'binet', 'Aurelie', 'binet', '$2y$10$XhPxRCpwhGVrlXhfcvRP9.H3Y9Bk/9i7ZBikMtTVoznkGxNCqkdgS', 'test@test.fr', '444444444444444');

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE `rdv` (
  `id_rdv` int(11) NOT NULL,
  `id_medecin` int(11) NOT NULL,
  `id_cabinetMedical` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `id_patient` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`id_rdv`, `id_medecin`, `id_cabinetMedical`, `id_examen`, `id_patient`, `Date`, `notes`) VALUES
(1, 1, 1, 1, 1, '2015-01-12 08:00:00', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cabinet médical`
--
ALTER TABLE `cabinet médical`
  ADD PRIMARY KEY (`id_CabinetMedical`);

--
-- Index pour la table `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id_examen`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id_medecin`),
  ADD KEY `id_CabinetMedical` (`id_CabinetMedical`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idpatient`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `numerodesecuritesociale` (`numerodesecuritesociale`);

--
-- Index pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`id_rdv`),
  ADD KEY `id_medecin` (`id_medecin`),
  ADD KEY `id_cabinetMedical` (`id_cabinetMedical`),
  ADD KEY `id_examen` (`id_examen`),
  ADD KEY `id_patient` (`id_patient`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cabinet médical`
--
ALTER TABLE `cabinet médical`
  MODIFY `id_CabinetMedical` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `examen`
--
ALTER TABLE `examen`
  MODIFY `id_examen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id_medecin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `idpatient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `id_rdv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD CONSTRAINT `medecin_ibfk_1` FOREIGN KEY (`id_CabinetMedical`) REFERENCES `cabinet médical` (`id_CabinetMedical`);

--
-- Contraintes pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `rdv_ibfk_1` FOREIGN KEY (`id_medecin`) REFERENCES `medecin` (`id_medecin`),
  ADD CONSTRAINT `rdv_ibfk_2` FOREIGN KEY (`id_cabinetMedical`) REFERENCES `cabinet médical` (`id_CabinetMedical`),
  ADD CONSTRAINT `rdv_ibfk_3` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`),
  ADD CONSTRAINT `rdv_ibfk_4` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`idpatient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
