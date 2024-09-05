<?php

define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', getenv('DB_CHARSET'));

$table_prefix  = 'wp_';

define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');