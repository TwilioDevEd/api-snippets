<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$message = $response->message();
$message->body('Hello World!');
$response->redirect('https://demo.twilio.com/welcome/sms/');

echo $response;
