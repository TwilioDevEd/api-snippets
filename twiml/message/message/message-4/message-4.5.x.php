<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$message = $response->message();
$message->media('https://demo.twilio.com/owl.png');

echo $response;
