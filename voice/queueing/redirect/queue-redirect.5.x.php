<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();

$response->say("You will now be connected to the first caller in the queue.");
$dial = $response->dial();
$dial->queue("Queue Demo");
$response->redirect();

echo $response;
