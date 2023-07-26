<?php

// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$account_sid = getenv("ACCOUNT_SID");
$api_key_sid = getenv("API_KEY_SID");
$api_key_secret = getenv("API_KEY_SECRET");

$to_number = getenv("TO_NUMBER");
$from_number = getenv("FROM_NUMBER");

$twilio = new Client(
    $api_key_sid,
    $api_key_secret,
    $account_sid,
    "ie1");

$twilio -> setEdge("dublin");

$call = $twilio->calls
               ->create($to_number,
                        $from_number,
                        [
                            "twiml" => "<Response><Say>Ahoy from Ireland</Say></Response>"
                        ]
               );
