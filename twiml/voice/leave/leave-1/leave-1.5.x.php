<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->enqueue('support', ['waitUrl' => 'wait.xml']);
$response->say('Unfortunately, the support line has closed. Please call again tomorrow.');

echo $response;