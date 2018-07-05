<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->redirect('../nextInstructions');

echo $response;
