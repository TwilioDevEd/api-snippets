<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

/// Instantiate a client using your API key and secret - but then, you'll need to
// manually specify your main account (or subaccount) SID when making a request
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$apiKey = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$apiSecret = 'your_api_secret';
$client = new Client($apiKey, $apiSecret, $accountSid);

// Send a message for the main account
$message = $client->messages->create(
    '+15558675309', // destination phone number
    array(
        'from' => '+15017250604', // twilio number in your account
        'body' => 'Never gonna give you up.'
    )
);

echo $message->sid;
