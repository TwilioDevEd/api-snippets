<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->say('Our store is located at 123 Easy St.');
$response->sms('Store Location: 123 Easy St.', ['action' => '/smsHandler.php',
    'method' => 'POST']);

echo $response;
