<?php
    /* Make a call using Twilio. You can run this file 3 different ways:
     *
     * 1. Save it as call.php and at the command line, run 
     *        php call.php
     *
     * 2. Upload it to a web host and load mywebhost.com/call.php 
     *    in a web browser.
     *
     * 3. Download a local server like WAMP, MAMP or XAMPP. Point the web root 
     *    directory to the folder containing this file, and load 
     *    localhost:8888/call.php in a web browser.
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
        // Initiate a new outbound call
        $call = $client->account->calls->create(
            // Step 4: Change the 'To' number below to whatever number you'd like 
            // to call.
            "+15558675310",

            // Step 5: Change the 'From' number below to be a valid Twilio number 
            // that you've purchased or verified with Twilio.
            "+15017122661",

            // Step 6: Set the URL Twilio will request when the call is answered.
            array("url" => "http://demo.twilio.com/welcome/voice/")
        );
        echo "Started call: " . $call->sid;
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
