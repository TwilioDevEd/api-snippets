<?php

    // start the session
    session_start();

    // get the session varible if it exists
    $counter = $_SESSION['counter'];

    // if it doesnt, set the default
    if(!strlen($counter)) {
        $counter = 0;
    }

    // increment it
    $counter++;

    // save it
    $_SESSION['counter'] = $counter;

    // make an associative array of senders we know, indexed by phone number
    $people = array(
        "+14158675308"=>"Rey",
        "+12349013030"=>"Finn",
        "+12348134522"=>"Chewy",
    );

    // if the sender is known, then greet them by name
    if(!$name = $people[$_REQUEST['From']]) {
        $name = "Friend";
    }

    // output the counter response
    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
    <Message><?php echo $name ?> has messaged <?php echo $_REQUEST['To']." ".$counter ?> times</Message>
</Response>