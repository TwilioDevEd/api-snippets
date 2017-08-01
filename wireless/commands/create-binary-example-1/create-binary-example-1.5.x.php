<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$command = $client->wireless
    ->commands
    ->create([
      "sim" => "AliceSmithSmartMeter",
      "command" => "SGVsbG8sIE1hY2hpbmUh==",
      "commandMode" => "binary",
      "callbackUrl" => "https://sim-manager.mycompany.com/commands/mobile-terminated-command-callback"
    ]);

print_r($command);
