<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// To set up environmental variables, see http://twil.io/secure
$account_sid = getenv('TWILIO_ACCOUNT_SID');
$auth_token = '[AuthToken]';
$twilio = new Client($account_sid, $auth_token);

$services = $twilio->messaging->v1->services("MG2172dd2db502e20dd981ef0d67850e1a")->delete();
