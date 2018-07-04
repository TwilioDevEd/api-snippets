<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->enqueue('support', ['waitUrl' => 'wait.xml']);
$response->say('Unfortunately, the support line has closed. Please call again tomorrow.');

echo $response;
