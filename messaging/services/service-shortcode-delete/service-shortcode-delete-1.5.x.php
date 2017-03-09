<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
$auth_token = 'your_auth_token'
$twilio = new Twilio($account_sid, $auth_token);

$shortCodes = $twilio->messaging->v1->services("MG2172dd2db502e20dd981ef0d67850e1a")
                                      ->shortCodes("SC3f94c94562ac88dccf16f8859a1a8b25")->delete();
