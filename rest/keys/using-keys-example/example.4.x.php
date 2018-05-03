<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('./twilio-php/Services/Twilio.php');

// Instantiate a client using your API key and secret - but then, you'll need to
// manually specify your main account (or subaccount) SID when making a request
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$apiKey = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$apiSecret = 'your_api_secret';
$client = new Services_Twilio($apiKey, $apiSecret);

// Get a reference to the main account
$account = $client->accounts->get($accountSid);

// Send a message for the main account
$message = $account->messages->create(
    array(
      'To' => '+15558675310', // destination phone number
      'From' => '+15017122661', // twilio number in your account
      'Body' => 'Never gonna give you up.'
    )
);

echo $message->sid;
