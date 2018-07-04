<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->number('415-123-4567', ['sendDigits' => 'wwww1928']);

echo $response;
