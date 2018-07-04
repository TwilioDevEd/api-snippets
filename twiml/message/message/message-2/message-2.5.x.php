<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$message = $response->message();
$message->body('Store Location: 123 Easy St.');
$message->media('https://demo.twilio.com/owl.png');

echo $response;
