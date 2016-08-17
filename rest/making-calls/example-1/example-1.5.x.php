<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
$token = "{{#authToken}}{{authToken}}{{/authToken}}";
$client = new Client($sid, $token);

$call = $client->calls->create(
    "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}", "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}",
    array("url" => "{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}")
);

echo $call->sid;
