<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{accountSid}}";
$token = "{{authToken}}";
$client = new Client($sid, $token);

$call = $client->calls->create(
    {{#toPhoneNumber}}"{{toPhoneNumber}}",{{/toPhoneNumber}}{{#toVoiceClient}}"{{toVoiceClient}}",{{/toVoiceClient}}
    {{#fromPhoneNumber}}"{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    array(
        {{#callUrl}}"url" => "{{callUrl}}",{{/callUrl}}
        {{#applicationSid}}"applicationSid" => "{{applicationSid}}",{{/applicationSid}}
        {{#sendDigitsVoice}}"sendDigits" => "{{sendDigitsVoice}}",{{/sendDigitsVoice}}
        {{#callMethod}}"method" => "{{callMethod}}",{{/callMethod}}
        {{#callStatusCallback}}"statusCallback" => "{{callStatusCallback}}",{{/callStatusCallback}}
        {{#callStatusCallbackMethod}}"statusCallbackMethod" => "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
        {{#callFallbackUrl}}"fallbackUrl" => "{{callFallbackUrl}}",{{/callFallbackUrl}}
        {{#callFallbackMethod}}"fallbackMethod" => "{{callFallbackMethod}}",{{/callFallbackMethod}}
        {{#callIfMachine}}"ifMachine" => "{{callIfMachine}}",{{/callIfMachine}}
        {{#callTimeout}}"timeout" => "{{callTimeout}}",{{/callTimeout}}
        {{#callRecord}}"record" => "{{callRecord}}",{{/callRecord}}
        {{#callRecordingChannels}}"recordingChannels" => "{{callRecordingChannels}}",{{/callRecordingChannels}}
        {{#callRecordingStatusCallback}}"recordingStatusCallback" => "{{callRecordingStatusCallback}}",{{/callRecordingStatusCallback}}
        {{#callRecordingStatusCallbackMethod}}"recordingStatusCallbackMethod" => "{{callRecordingStatusCallbackMethod}}",{{/callRecordingStatusCallbackMethod}}
        {{#callSipAuthUsername}}"sipAuthUsername" => "{{callSipAuthUsername}}",{{/callSipAuthUsername}}
        {{#callSipAuthPassword}}"sipAuthPassword" => "{{callSipAuthPassword}}",{{/callSipAuthPassword}}
        {{#callStatusCallbackEvent}}
        "statusCallbackEvent" => array(
            {{#callStatusCallbackEvents}}{{.}},{{/callStatusCallbackEvents}}
        ),
        {{/callStatusCallbackEvent}}
    )
);

echo $call->sid;
