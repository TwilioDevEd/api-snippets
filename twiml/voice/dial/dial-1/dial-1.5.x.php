<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial();
$dial->number('415-123-4567');


echo $response;