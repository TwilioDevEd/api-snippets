<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$gather = $response->gather(['action' => '/process_gather.php', 'method' => 'GET']);
$gather->say('Please enter your account number,\nfollowed by the pound sign');
$response->say('We didn\'t receive any input. Goodbye!');

echo $response;
