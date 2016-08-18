<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
{{#accountSid}}$sid = "{{accountSid}}";{{/accountSid}}
{{#authToken}}$token = "{{authToken}}";{{/authToken}}
$client = new Client($sid, $token);

$call = $client->calls->create(
    {{#toPhoneNumber}}"{{toPhoneNumber}}",{{/toPhoneNumber}}{{#toVoiceClient}}"{{toVoiceClient}}",{{/toVoiceClient}}
    {{#fromPhoneNumber}}"{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    array(
        {{#callUrl}}"url" => "{{callUrl}}",{{/callUrl}}
        {{#sendDigitsVoice}}"sendDigits" => "{{#sendDigitsVoice}}",{{/sendDigitsVoice}}
        {{#callMethod}}"method" => "{{#callMethod}}",{{/callMethod}}
        {{#callStatusCallback}}"statusCallback" => "{{callStatusCallback}}",{{/callStatusCallback}}
        {{#callStatusCallbackMethod}}"statusCallbackMethod" => "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
        {{#callStatusCallbackEvent}}
        "statusCallbackEvent" => array(
            {{#callStatusCallbackEvents}}{{callStatusCallbackEvents}},{{/callStatusCallbackEvents}}
        ),
        {{/callStatusCallbackEvent}}
    )
);

echo $call->sid;
