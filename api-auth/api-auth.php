<?php
// require_once './vendor/autoload.php'; // Loads the library
require __DIR__ . '/twilio-php-master/Twilio/autoload.php';
use Twilio\Rest\Client;

$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; // Your Account Sid from twilio.com/user/account
$api_key = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; // You can generate this from www.twilio.com/console/runtime/api-keys/create
$api_secret = "your_api_secret"; // You can generate this from www.twilio.com/console/runtime/api-keys/create
$client = new Client($api_key, $api_secret, $sid);

?>
