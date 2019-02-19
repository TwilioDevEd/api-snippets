<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$city = $_REQUEST['FromCity'] ?? 'Guayaquil';

$response = new TwiML();
$response->say("Never gonna give you up, {$city}!", array('voice' => 'alice'));
$response->play("https://demo.twilio.com/docs/classic.mp3");

echo $response;