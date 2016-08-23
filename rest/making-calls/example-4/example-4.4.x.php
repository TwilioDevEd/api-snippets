<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{#accountSid}}{{accountSid}}{{/accountSid}}";
$token = "{{#authToken}}{{authToken}}{{/authToken}}";
$client = new Services_Twilio($sid, $token);

$call = $client->account->calls->create("{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}", "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}", "{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}", array(
    "Method" => "{{#getHttpMethod}}{{getHttpMethod}}{{/getHttpMethod}}",
    "StatusCallback" => "{{#voiceStatusCallbackUrl}}{{voiceStatusCallbackUrl}}{{/voiceStatusCallbackUrl}}",
    "StatusCallbackMethod" => "{{#postHttpMethod}}{{postHttpMethod}}{{/postHttpMethod}}",
    "StatusCallbackEvent" => array("{{#initiatedCallEvent}}{{initiatedCallEvent}}{{/initiatedCallEvent}}", "{{#ringingCallEvent}}{{ringingCallEvent}}{{/ringingCallEvent}}", "{{#answeredCallEvent}}{{answeredCallEvent}}{{/answeredCallEvent}}", "{{#completedCallEvent}}{{completedCallEvent}}{{/completedCallEvent}}"),
    ));
echo $call->sid;
