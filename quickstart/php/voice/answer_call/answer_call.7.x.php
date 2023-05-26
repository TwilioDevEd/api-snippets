<?php
require __DIR__ . '/vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

// Start our TwiML response
$response = new VoiceResponse;

// Read a message aloud to the caller
$response->say(
    "Thank you for calling! Have a great day.", 
    array("voice" => "Polly.Amy")
);

echo $response;