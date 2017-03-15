<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
$auth_token = 'your_auth_token'
$twilio = new Twilio($account_sid, $auth_token);

$phoneNumbers = $twilio->messaging->v1->services("MG2172dd2db502e20dd981ef0d67850e1a")
                                      ->phoneNumbers("PN557ce644e5ab84fa21cc21112e22c485")->delete();
