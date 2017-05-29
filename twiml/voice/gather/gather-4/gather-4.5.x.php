<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$gather = $response->gather(['action' => '/completed', 'input' => 'speech']);
$gather->say('Welcome to Twilio, please tell us why you\'re calling');

echo $response;
