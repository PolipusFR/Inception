<?php

// Définir le nom de la base de données utilisée par WordPress
define( 'DB_NAME', '__MYSQL_DATABASE__'); // Remplacez __MYSQL_DATABASE__ par le nom de votre base de données

// Définir le nom d'utilisateur de la base de données
define( 'DB_USER', '__MYSQL_USER__' ); // Remplacez __MYSQL_USER__ par le nom d'utilisateur de votre base de données

// Définir le mot de passe de la base de données
define( 'DB_PASSWORD', '__MYSQL_PASSWORD__' ); // Remplacez __MYSQL_PASSWORD__ par le mot de passe de votre base de données

// Définir l'hôte de la base de données
define( 'DB_HOST', '__DB_HOST__' ); // Remplacez __DB_HOST__ par l'adresse de l'hôte de votre base de données (ex: localhost, IP, etc.)

// Définir le jeu de caractères de la base de données
define( 'DB_CHARSET', 'utf8' ); // UTF-8 est le jeu de caractères recommandé pour WordPress

// Définir le collationnement de la base de données (laisser vide par défaut)
define( 'DB_COLLATE', '' ); // En général, cette valeur reste vide

// Clés et sels d'authentification pour sécuriser les sessions et cookies
// Remplacez chaque phrase par des chaînes générées via https://api.wordpress.org/secret-key/1.1/salt/
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

// Préfixe des tables dans la base de données
// Modifiez ce préfixe pour des raisons de sécurité (ex: 'wp_', 'custom_prefix_')
$table_prefix = 'wordpress_';

// Activer le mode débogage de WordPress (utile pour le développement)
define( 'WP_DEBUG', true ); // True active le débogage, False le désactive

// Chemin du fichier de log des erreurs WordPress
define( 'WP_DEBUG_LOG', '/tmp/wp-errors.log' ); // Les erreurs seront enregistrées dans ce fichier

// Vérifie si la constante ABSPATH est définie, sinon la définit au chemin du répertoire actuel
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' ); // Définit le chemin absolu du répertoire WordPress
}

// Activer la mise en cache de WordPress
define( 'WP_CACHE', true ); // Active la mise en cache

// Ajouter un sel unique pour les clés de cache afin d'éviter les conflits entre sites
define( 'WP_CACHE_KEY_SALT',  '_server_name_'); // Remplacez _server_name_ par une chaîne unique pour ce serveur

define ('FS_METHOD', 'direct'); // Permet de télécharger et installer des thèmes et plugins sans demander de mot de passe FTP

// Inclure les fichiers principaux de WordPress
require_once ABSPATH . 'wp-settings.php'; // Charge les réglages et initialisations de WordPress
