<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{accountSid}}";
$token = "{{authToken}}";
$client = new Services_Twilio($sid, $token);

$call = $client->account->calls->create(
    {{#fromPhoneNumber}}"{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    {{#toPhoneNumber}}"{{toPhoneNumber}}",{{/toPhoneNumber}}{{#toVoiceClient}}"{{toVoiceClient}}",{{/toVoiceClient}}
    {{#callUrl}}"{{callUrl}}",{{/callUrl}}{{#applicationSid}}"{{applicationSid}}",{{/applicationSid}}
    array(
        {{#sendDigitsVoice}}"SendDigits" => "{{sendDigitsVoice}}",{{/sendDigitsVoice}}
        {{#callMethod}}"Method" => "{{callMethod}}",{{/callMethod}}
        {{#callStatusCallback}}"StatusCallback" => "{{callStatusCallback}}",{{/callStatusCallback}}
        {{#callStatusCallbackMethod}}"StatusCallbackMethod" => "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
        {{#callFallbackUrl}}"FallbackUrl" => "{{callFallbackUrl}}",{{/callFallbackUrl}}
        {{#callFallbackMethod}}"FallbackMethod" => "{{callFallbackMethod}}",{{/callFallbackMethod}}
        {{#callIfMachine}}"IfMachine" => "{{callIfMachine}}",{{/callIfMachine}}
        {{#callTimeout}}"Timeout" => "{{callTimeout}}",{{/callTimeout}}
        {{#callRecord}}"Record" => "{{callRecord}}",{{/callRecord}}
        {{#callRecordingChannels}}"RecordingChannels" => "{{callRecordingChannels}}",{{/callRecordingChannels}}
        {{#callRecordingStatusCallback}}"RecordingStatusCallback" => "{{callRecordingStatusCallback}}",{{/callRecordingStatusCallback}}
        {{#callRecordingStatusCallbackMethod}}"RecordingStatusCallbackMethod" => "{{callRecordingStatusCallbackMethod}}",{{/callRecordingStatusCallbackMethod}}
        {{#callSipAuthUsername}}"SipAuthUsername" => "{{callSipAuthUsername}}",{{/callSipAuthUsername}}
        {{#callSipAuthPassword}}"SipAuthPassword" => "{{callSipAuthPassword}}",{{/callSipAuthPassword}}
        {{#callStatusCallbackEvent}}
        "StatusCallbackEvent" => array(
            {{#callStatusCallbackEvents}}{{.}},{{/callStatusCallbackEvents}}
        ),
        {{/callStatusCallbackEvent}}
    )
);
echo $call->sid;
