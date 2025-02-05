<?php
define('DB_NAME', getenv('WORDPRESS_DB_NAME'));
define('DB_USER', getenv('WORDPRESS_DB_USER'));
define('DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD'));
define('DB_HOST', getenv('WORDPRESS_DB_HOST'));

define('AUTH_KEY',         'unique key here');
define('SECURE_AUTH_KEY',  'unique key here');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if (!defined('ABSPATH'))
    define('ABSPATH', __DIR__ . '/');
require_once ABSPATH . 'wp-settings.php';