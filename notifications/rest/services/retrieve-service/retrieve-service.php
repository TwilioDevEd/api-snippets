<?php
// Get the PHP helper library from twilio.com/docs/php/install
require './vendor/autoload.php';

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "{{ auth_token }}"; 

// Initialize the client
$client = new Twilio\Rest\Client($sid, $token);

$service = $client->notifications->v1->services("ISxxx")
->fetch();

print print_r($service, true);