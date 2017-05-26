<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->say('Our store is located at 123 Easy St.');
$response->sms('Store Location: 123 Easy St.', ['statusCallback' => '/smsHandler.php']);

echo $response;
