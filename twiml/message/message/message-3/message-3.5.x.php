<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$message = $response->message(['action' => '/SmsHandler.php',
    'method' => 'POST']);
$message->body('Store Location: 123 Easy St.');

echo $response;
