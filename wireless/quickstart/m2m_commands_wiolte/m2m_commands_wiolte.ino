/*
    Twilio Machine to Machine Commands Quickstart for the Seeed Studio Wio LTE
*/

#include <WioLTEforArduino.h>
#define INTERVAL  (1000)

WioLTE Wio;

void setup() {
  SerialUSB.println("");
  SerialUSB.println("--- START ---------------------------------------------------");

  /*
     Seeed Studio Wio LTE setup
  */
  SerialUSB.println("### I/O Initialize");
  Wio.Init();

  SerialUSB.println("### Power supply ON");
  Wio.PowerSupplyLTE(true);
  delay(500);

  SerialUSB.println("### Turn on or reset");
  if (!Wio.TurnOnOrReset()) {
    SerialUSB.println("### ERROR! ###");
    return;
  }
  delay(3000);

  SerialUSB.println("### Setup completed");
  delay(3000);

  /*
    Keep `command` under 160 ASCII characters, or 67 UCS-2 characters.
    https://www.twilio.com/docs/glossary/what-sms-character-limit
  */
  SerialUSB.println("### Sending Command");
  char message[128] = "Hello from the Wio LTE!";

  /*
    Send an SMS to short code 2936, which is a Twilio
    Machine-to-Machine command.

    Write a Twilio M2M command.
  */
  if (!Wio.SendSMS("2936", message)) {
    SerialUSB.println("### ERROR! ###");
    return;
  }
  SerialUSB.println("### Command Sent");
  delay(3000);
  SerialUSB.println("### Waiting for Command");
}

void loop() {
  while (true) {

    char str[100];

    /*
        Read a Twilio M2M command. Note that it will find the lowest
        indexed one with the code as is; in your code. if you cache the
        index you can start the next read_command to move to the next one.
    */
    int strLen = Wio.ReceiveSMS(str, sizeof (str));

    if (strLen < 0) {
      SerialUSB.println("### ERROR! ###");
      goto err;
    }
    
    /* Receive command */
    if (strLen == 0) break;
    SerialUSB.println("### Command Received");

    /* Print the command */
    SerialUSB.println(str);

    /* Delete the stored command */
    if (!Wio.DeleteReceivedSMS()) {
      SerialUSB.println("### ERROR! ###");
      goto err;
    }
  }

err:
  delay(INTERVAL);
}
