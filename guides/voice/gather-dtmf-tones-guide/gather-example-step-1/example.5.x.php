<?php
// Create a route that will handle Twilio webhook requests, sent as an
// HTTP POST to /voice in our application
require_once '/path/to/vendor/autoload.php';

use Twilio\TwiML\VoiceResponse;

// Use the Twilio PHP SDK to build an XML response
$response = new VoiceResponse();

// If the user entered digits, process their request
if (array_key_exists('Digits', $_POST)) {
    switch ($_POST['Digits']) {
    case 1:
        $response->say('You selected sales. Good for you!');
        break;
    case 2:
        $response->say('You need support. We will help!');
        break;
    default:
        $response->say('Sorry, I don\'t understand that choice.');
    }
} else {
    // If no input was sent, use the <Gather> verb to collect user input
    $gather = $response->gather(array('numDigits' => 1));
    // use the <Say> verb to request input from the user
    $gather->say('For sales, press 1. For support, press 2.');

    // If the user doesn't enter input, loop
    $response->redirect('/voice');
}

// Render the response as XML in reply to the webhook request
header('Content-Type: text/xml');
echo $response;
