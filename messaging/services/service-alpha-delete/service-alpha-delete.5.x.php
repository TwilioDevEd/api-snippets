<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// To set up environmental variables, see http://twil.io/secure
$account_sid = getenv('TWILIO_ACCOUNT_SID');
$auth_token = getenv('TWILIO_AUTH_TOKEN');
$twilio = new Client($account_sid, $auth_token);

$alpha_senders = $twilio->messaging->v1->services("MG2172dd2db502e20dd981ef0d67850e1a")
                                      ->alphaSenders("AIc781610ec0b3400c9e0cab8e757da937")->delete();
