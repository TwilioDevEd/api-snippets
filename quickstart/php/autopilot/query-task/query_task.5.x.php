<?php
// Download the helper library from https://www.twilio.com/docs/php/install
// Update the path below to your autoload.php if not installed in local dir.
// see https://getcomposer.org/doc/01-basic-usage.md
require_once './vendor/autoload.php';
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid    = getenv('TWILIO_ACCOUNT_SID');
$token  = getenv('TWILIO_AUTH_TOKEN');
$twilio = new Client($sid, $token);

// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
$query = $twilio->preview->understand
                         ->assistants("UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                         ->queries
                         ->create($language = "en-us", $query = "Tell me a joke");

print($query->results["task"]);
?>
