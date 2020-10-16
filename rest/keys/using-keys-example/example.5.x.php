<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

/// Instantiate a client using your API key and secret - but then, you'll need to
// manually specify your main account (or subaccount) SID when making a request
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$apiKey = getenv('TWILIO_API_KEY');
$apiSecret = getenv('TWILIO_API_KEY_SECRET');
$client = new Client($apiKey, $apiSecret, $accountSid);

// Send a message for the main account
$message = $client->messages->create(
    '+15558675310', // destination phone number
    array(
        'from' => '+15017122661', // twilio number in your account
        'body' => 'Never gonna give you up.'
    )
);

echo $message->sid;
