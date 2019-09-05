<?php

// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Auth Token at twilio.com/console
// DANGER! This is insecure. See http://twil.io/secure
$sid    = "AC00000000000000000000000000000001";
$token  = "your_auth_token";
$twilio = new Client($sid, $token);

$incoming_phone_number = $twilio->incomingPhoneNumbers("PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                                ->update(array(
                                             "accountSid" => "AC00000000000000000000000000000002"
                                         )
                                );

print($incoming_phone_number->friendlyName);
