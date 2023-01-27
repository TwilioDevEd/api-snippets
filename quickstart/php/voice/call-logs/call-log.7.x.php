<?php
    /* Get Twilio call logs. You can run this file by saving it
     * as call-log.php and running:
     *        php call-log.php
     */

    // Step 1: Get the Twilio-PHP library from twilio.com/docs/libraries/php, 
    // following the instructions to install it with Composer.
    require_once "vendor/autoload.php";
    use Twilio\Rest\Client;
    
    // Step 2: Set our AccountSid and AuthToken from https://twilio.com/console
// To set up environmental variables, see http://twil.io/secure
    $AccountSid = getenv('TWILIO_ACCOUNT_SID');
    $AuthToken = getenv('TWILIO_AUTH_TOKEN');

    // Step 3: Instantiate a new Twilio Rest Client
    $client = new Client($AccountSid, $AuthToken);

    try {
        // Get Recent Calls
        foreach ($client->account->calls->read() as $call) {
            $time = $call->startTime->format("Y-m-d H:i:s");
            echo "Call from $call->from to $call->to at $time of length $call->duration \n";
        }
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }