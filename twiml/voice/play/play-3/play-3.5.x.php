<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->play(['digits' => 'wwww3']);

echo $response;
