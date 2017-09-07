<?php

    // if the caller pressed anything but 1 or 2 send them back
    if ($_REQUEST['Digits'] != '1' and $_REQUEST['Digits'] != '2') {
        header("Location: handle-gather.php");
        die;
    }

    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
<?php if ($_REQUEST['Digits'] == '1') {
    ?>
    <Dial>+13105551212</Dial>
    <Say>The call failed or the remote party hung up.  Goodbye.</Say>
<?php
} elseif ($_REQUEST['Digits'] == '2') {
        ?>
    <Say>Record your message after the tone.</Say>
    <Record maxLength="30" action="handle-recording.php" />
<?php
    } ?>
</Response>