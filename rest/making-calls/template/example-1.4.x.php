<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
{{#accountSid}}$sid = "{{accountSid}}";{{/accountSid}}
{{#authToken}}$token = "{{authToken}}";{{/authToken}}
$client = new Services_Twilio($sid, $token);

$call = $client->account->calls->create(
    {{#fromPhoneNumber}}"{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    {{#toPhoneNumber}}"{{toPhoneNumber}}",{{/toPhoneNumber}}{{#toVoiceClient}}"{{toVoiceClient}}",{{/toVoiceClient}}
    {{#callUrl}}"{{callUrl}}",{{/callUrl}}
    array(
        {{#sendDigitsVoice}}"SendDigits" => "{{#sendDigitsVoice}}",{{/sendDigitsVoice}}
        {{#callMethod}}"Method" => "{{#callMethod}}",{{/callMethod}}
        {{#callStatusCallback}}"StatusCallback" => "{{callStatusCallback}}",{{/callStatusCallback}}
        {{#callStatusCallbackMethod}}"StatusCallbackMethod" => "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
        {{#callStatusCallbackEvent}}
        "StatusCallbackEvent" => array(
            {{#callStatusCallbackEvents}}{{callStatusCallbackEvents}},{{/callStatusCallbackEvents}}
        ),
        {{/callStatusCallbackEvent}}
    )
);
echo $call->sid;
