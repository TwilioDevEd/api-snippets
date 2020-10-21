<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// To set up environmental variables, see http://twil.io/secure
$account_sid = getenv('TWILIO_ACCOUNT_SID');
$auth_token = getenv('TWILIO_AUTH_TOKEN');
$twilio = new Client($account_sid, $auth_token);

$service = $twilio->messaging->v1->services->create("My First Service",
                                                    array('statusCallback' => "http://requestb.in/1234abcd")
                                                   );