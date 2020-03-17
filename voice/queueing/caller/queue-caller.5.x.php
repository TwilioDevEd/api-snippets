<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Twiml\VoiceResponse;

$response = new VoiceResponse();
$response->enqueue('Queue Demo');

echo $response;
