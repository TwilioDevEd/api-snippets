<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\MessagingResponse;

$response = new MessagingResponse();
$message = $response->message('');
$message->body('Store Location: 123 Easy St.');
$message->media('https://demo.twilio.com/owl.png');

echo $response;
