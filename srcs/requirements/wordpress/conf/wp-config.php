<?php

// Load Composer's autoloader
require_once __DIR__ . '/vendor/autoload.php';

// Load environment variables from .env file
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', getenv('DB_CHARSET'));

// define('AUTH_KEY', getenv('AUTH_KEY'));
// define('SECURE_AUTH_KEY', getenv('SECURE_AUTH_KEY'));
// define('LOGGED_IN_KEY', getenv('LOGGED_IN_KEY'));
// define('NONCE_KEY', getenv('NONCE_KEY'));
// define('AUTH_SALT', getenv('AUTH_SALT'));
// define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT'));

$table_prefix  = 'wp_';

define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
