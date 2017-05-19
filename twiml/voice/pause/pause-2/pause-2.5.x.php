<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->pause(['length' => 5]);
$response->say('Hi there.');

echo $response;
