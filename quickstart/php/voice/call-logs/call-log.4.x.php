<?php
    /* Get Twilio call logs. You can run this file by saving it
     * as call-log.php and running:
     *        php call-log.php
     */

    // Step 1: Get the Twilio-PHP library from twilio.com/docs/libraries/php, 
    // and move it into the folder containing this call-log.php file.
    require "Services/Twilio.php";

    // Step 2: Set our AccountSid and AuthToken from https://twilio.com/console
    $AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    $AuthToken = "your_auth_token";

    // Step 3: Instantiate a new Twilio Rest Client
    $client = new Services_Twilio($AccountSid, $AuthToken);

    try {
        // Get Recent Calls
        foreach ($client->account->calls as $call) {
            echo "Call from $call->from to $call->to at $call->start_time of length $call->duration \n";
        }
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }