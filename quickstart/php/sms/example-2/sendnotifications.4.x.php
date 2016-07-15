<?php
    // Step 5: Loop over all our friends. $number is a phone number above, and 
    // $name is the name next to it
    foreach ($people as $number => $name) {

        $sms = $client->account->messages->sendMessage(

            // Step 6: Change the 'From' number below to be a valid Twilio number
            // that you've purchased
            "YYY-YYY-YYYY",

            // the number we are sending to - Any phone number
            $number,

            // the sms body
            "Hey $name, Monkey Party at 6PM. Bring Bananas!",

            // Step 7: Add a url to the image media you want to send
            array("https://demo.twilio.com/owl.png", "https://demo.twilio.com/logo.png")
        );

        // Display a confirmation message on the screen
        echo "Sent message to $name";
    }
