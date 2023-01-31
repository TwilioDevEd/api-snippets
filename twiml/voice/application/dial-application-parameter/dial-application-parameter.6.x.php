<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$application = $dial->application();
$application->applicationsid('AP1234567890abcdef1234567890abcd');
$application->parameter(['name' => 'AccountNumber', 'value' => '12345']);
$application->parameter(['name' => 'TicketNumber', 'value' => '9876']);

echo $response;
