<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->redirect('http://pigeons.com/twiml.xml', ['method' => 'POST']);

echo $response;
