<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\MessagingResponse;

$response = new MessagingResponse();
$response->redirect('http://www.example.com/nextInstructions');

echo $response;
