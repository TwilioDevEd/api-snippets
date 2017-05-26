<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$dial = $response->dial();
$dial->client('jenny');

echo $response;
