<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->message('Store Location: 123 Easy St.',
    ['action' => '/SmsHandler.php', 'method' => 'POST']);

echo $response;
