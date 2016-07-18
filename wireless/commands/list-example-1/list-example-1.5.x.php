<?php
// Download the **Next-Gen** twilio-php library from:
// twilio.com/docs/libraries/php#installation-nextgen
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID from www.twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
// Your Auth Token from www.twilio.com/console
$token = "your_auth_token";

// Initialize Twilio Rest Client
$client = new Client($sid, $token);

// List all commands
$commands = $client->preview->wireless->commands->stream();

foreach ($commands as $cmd) {
    echo $cmd->command . PHP_EOL;
}
