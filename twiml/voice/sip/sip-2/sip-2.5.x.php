<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->sip('sip:kate@example.com', ['username' => 'admin',
    'password' => '1234']);

echo $response;
