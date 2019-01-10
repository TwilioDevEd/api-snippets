/*
    Twilio Machine to Machine Commands Quickstart for the Seeed Studio Wio LTE
*/
#include "wio_tracker.h"

/*
  Globals for receiving incoming Commands
*/
uint16_t newSMSNumber = -1;
char receivedMessage[128];

/*
  Create a Wio instance
*/
WioTracker wio = WioTracker();

void setup() {
  /*
    Modem setup
  */
  wio.Power_On();
  SerialUSB.println("Power On!");
  SerialUSB.println("Start network registration...");

  /*
    Network registration
  */
  if (!wio.waitForNetworkRegister())
  {
    SerialUSB.println("Network error");
    return;
  } else {
    SerialUSB.println("Network registration complete");
  }
  
  /*
    Set all "REC UNREAD SMS" to "REC READ SMS"
  */
  wio.readAllRecUnreadSMS();

  /*
    Keep `command` under 160 ASCII characters, or 67 UCS-2 characters.
    https://www.twilio.com/docs/glossary/what-sms-character-limit
  */
  SerialUSB.println("Sending Command");
  char message[128] = "Hello from the Wio LTE!";

  /*
    Send an SMS to short code 2936, which is a Twilio
    Machine-to-Machine command.

    Write a Twilio M2M command.
  */
  if (wio.sendSMS("2936", message))
  {
    SerialUSB.println("Command Sent");
  }
  else
  {
    SerialUSB.println("Send Error");
  }
  SerialUSB.println("Waiting for Command");
}

void loop() {
  /*
    Detect unread Commands
  */
  int id = wio.detectRecUnreadSMS();

  /*
    Define the index of the incoming Commands
  */
  if (-1 != id) {
    newSMSNumber = id;

    /*
      Read a Twilio M2M command. Note that it will find the lowest
      indexed one with the code as is; in your code. if you cache the
      index you can start the next read_command to move to the next one.
    */
    wio.readSMS(newSMSNumber, receivedMessage, 128);
    SerialUSB.println("Command Received");
    SerialUSB.println(receivedMessage);
  }
  delay(1000);
}
