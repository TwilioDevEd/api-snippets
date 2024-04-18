<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\MessagingResponse;

$response = new MessagingResponse();
$response->message('Store Location: 123 Easy St.',
    ['action' => '/SmsHandler.php', 'method' => 'POST']);

echo $response;
