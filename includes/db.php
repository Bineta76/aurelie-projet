<?php
$host = "localhost";  // Serveur MySQL (par défaut localhost sous XAMPP)
$user = "root";       // Utilisateur MySQL par défaut sous XAMPP
$pass = "";           // Aucun mot de passe par défaut sous XAMPP
$db = "bdd";        // Base de données existante (ou mets la tienne)

// Connexion MySQLi
$conn = new mysqli($host, $user, $pass, $db);

// Vérification de la connexion
if ($conn->connect_error) {
    die("Connexion échouée : " . $conn->connect_error);
}
echo "Connexion réussie à MySQL ! 🎉";




