<?php

// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Auth Token at twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$sub_account_sid = getenv('TWILIO_SUBACCOUNT_SID');
$twilio = new Client($sid, $token);

$incoming_phone_number = $twilio->incomingPhoneNumbers("PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                                ->update(array(
                                             "accountSid" => $sub_account_sid
                                         )
                                );

print($incoming_phone_number->friendlyName);
