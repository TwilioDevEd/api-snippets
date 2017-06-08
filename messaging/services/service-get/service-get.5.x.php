<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$auth_token = '[AuthToken]';
$twilio = new Client($account_sid, $auth_token);

$services = $twilio->messaging->v1->services("MG2172dd2db502e20dd981ef0d67850e1a")->fetch();

print($services->sid);
