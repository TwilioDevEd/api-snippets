<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->pause(['length' => 5]);
$response->say('Hi there.');

echo $response;
