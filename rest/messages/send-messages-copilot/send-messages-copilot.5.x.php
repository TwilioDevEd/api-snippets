<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once 'vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Download the PHP helper library from twilio.com/docs/php/install
// These vars are your accountSid and authToken from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$account_sid = getenv('TWILIO_ACCOUNT_SID');
$auth_token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($account_sid, $auth_token);

$client->messages->create(
    "+441632960675",
    array(
        'messagingServiceSid' => "MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        'body' => "Phantom Menace was clearly the best of the prequel trilogy."
    )
);
