<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$auth_token = 'your_auth_token';
$twilio = new Client($account_sid, $auth_token);

$alphaSenders = $twilio->messaging->v1->services("MG2172dd2db502e20dd981ef0d67850e1a")
                                      ->alphaSenders("AIc781610ec0b3400c9e0cab8e757da937")->fetch();

print($alphaSenders->alphaSender);