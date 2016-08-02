<?php

    // now greet the caller
    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
    <Say>Hello. It's me.</Say>
    <Play>http://ia600303.us.archive.org/4/items/Wednesdy-tuesdy-ramblinSound/Wednesdy-tuesdyRamblinSound.mp3</Play>
    <Gather numDigits="1" action="handle-gather.php" method="POST">
        <Say>
            To speak with a real person, press 1.  
            Press 2 to record a message for a Twilio educator.  
            Press any other key to start over.
        </Say>
    </Gather>
</Response>

-------------------------------------------
<!-- New File -->

<?php

    // if the caller pressed anything but 1 or 2 send them back
    if($_REQUEST['Digits'] != '1' and $_REQUEST['Digits'] != '2') {
        header("Location: handle-gather.php");
        die;
    }

    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
<?php if ($_REQUEST['Digits'] == '1') { ?>
    <Dial>+13105551212</Dial>
    <Say>The call failed or the remote party hung up.  Goodbye.</Say>
<?php } elseif ($_REQUEST['Digits'] == '2') { ?>
    <Say>Record your message after the tone.</Say>
    <Record maxLength="30" action="handle-recording.php" />
<?php } ?>
</Response>

--------------------------------------------
<!-- New File -->

<?php
    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
    <Say>Listen to your recorded message.</Say>
    <Play><?php echo $_REQUEST['RecordingUrl']; ?></Play>
    <Say>Goodbye.</Say>
</Response>
