<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$dial = $response->dial(['record' => 'true', 'timeout' => 10,
    'hangupOnStar' => 'true', 'callerId' => 'bob', 'method' => 'POST',
    'action' => '/handle_post_dial']);
$dial->sip('sip:kate@example.com?customheader=foo', ['method' => 'POST',
    'url' => '/handle_screening_on_answer']);

echo $response;
