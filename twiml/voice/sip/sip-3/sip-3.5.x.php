<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->sip('sip:jack@example.com?mycustomheader=foo&myotherheader=bar');

echo $response;
