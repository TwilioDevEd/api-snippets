<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->reject(['reason' => 'busy']);

echo $response;
