<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial(['callerId' => '+15551112222']);
$dial->number('+15558675310');

echo $response;
