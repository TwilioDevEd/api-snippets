<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->dial('415-123-4567', ['action' => '/handleDialCallStatus.php',
    'method' => 'GET']);
$response->say('I am unreachable');

echo $response;
