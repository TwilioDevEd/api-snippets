<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->message('Hello World!');
$response->redirect('https://demo.twilio.com/sms/welcome');

echo $response;
