<?php
require __DIR__ . '/vendor/autoload.php';
use Twilio\Rest\Client;

// Your Account SID and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$account_sid = getenv('TWILIO_ACCOUNT_SID');
$auth_token = getenv('TWILIO_AUTH_TOKEN');
// In production, these should be environment variables. E.g.:
// $auth_token = $_ENV["TWILIO_AUTH_TOKEN"]

// A Twilio number you own with SMS capabilities
$twilio_number = "+7785125390";

$client = new Client($ACf77289c96ef91874a091dac30e2f9c92, $08ee5df40fa25eb77a8015e29baec703);
$client->messages->create(
    // Where to send a text message (your cell phone?)
    '+5390',
    array(
        'from' => $twilio_number,
        'body' => 'I sent this message in under 10 minutes!'
    )
);
