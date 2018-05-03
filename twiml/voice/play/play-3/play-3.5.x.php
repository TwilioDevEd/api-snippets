<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->play(['digits' => 'wwww3']);

echo $response;
