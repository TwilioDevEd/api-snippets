<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial(['callerId' => '+1888XXXXXXX']);
$dial->number('858-987-6543');
$dial->client('jenny');
$dial->client('tommy');


echo $response;