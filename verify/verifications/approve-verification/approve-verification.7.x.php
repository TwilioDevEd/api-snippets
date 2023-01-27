<?php

// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Auth Token at twilio.com/console
// DANGER! This is insecure. See http://twil.io/secure
// To set up environmental variables, see http://twil.io/secure
$sid    = getenv('TWILIO_ACCOUNT_SID');
$token  = getenv('TWILIO_AUTH_TOKEN');
$twilio = new Client($sid, $token);

$verification = $twilio->verify->v2->services("VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                                   ->verifications("+15017122661")
                                   ->update("approved");

print($verification->to);