<?php

    // now greet the caller
    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
    <Say>Hello. It's me.</Say>
    <Play>http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3</Play>
    <Gather numDigits="1" action="handle-gather.php" method="POST">
        <Say>
            To speak with a real person, press 1.  
            Press 2 to record a message for a Twilio educator.  
            Press any other key to start over.
        </Say>
    </Gather>
</Response>
