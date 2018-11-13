<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\MessagingResponse;

$response = new MessagingResponse();
$response->message('This is message 1 of 2.');
$response->message('This is message 2 of 2.');

echo $response;
