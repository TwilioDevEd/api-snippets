<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->message('Store Location: 123 Easy St.',
    ['action' => '/SmsHandler.php', 'method' => 'POST']);

echo $response;
