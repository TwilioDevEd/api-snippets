<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$city = $_REQUEST['FromCity'] ?? 'Guayaquil';

$response = new TwiML();
$gather = $response->gather(['input' => 'speech dtmf', 'numDigits' => '1']);
$gather->say("Never gonna give you up, {$city}!", array('voice' => 'alice'));
$gather->play("https://demo.twilio.com/docs/classic.mp3");

echo $response;