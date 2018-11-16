/*
    Twilio Machine to Machine Commands Quickstart on Arduino MKR GSM 1400
*/

#include <MKRGSM.h>

/*
    Arduino MKR GSM1400 definitions:
    https://www.arduino.cc/en/Reference/GSM
*/
GSM gsmAccess;
GSM_SMS sms;

char senderNumber[20];

void setup() {
  Serial.begin(9600);
  boolean connected = false;

  /*
     Arduino MKR GSM 1400 setup
  */
  gsmAccess.begin();
  Serial.println("GSM initialized");
  Serial.println("Sending Command");

  /*
     Send an SMS to short code 2936, which is a Twilio
     Machine to machine command.
  */
  sms.beginSMS("2936");

  /*
      Keep `command` under 160 ASCII characters, or 67 UCS-2 characters.
      https://www.twilio.com/docs/glossary/what-sms-character-limit
  */
  sms.print("Hello World from the MKR 1400");

  /*
      Write a Twilio M2M command.
  */
  sms.endSMS();
  Serial.println("Command Sent!");
  delay(2000);
  Serial.println("Waiting for Commands");
}

void loop() {
  int c;

  /*
      Read a Twilio M2M command. Note that it will find the lowest
      indexed one with the code as is; in your code. if you cache the
      index you can start the next read_command to move to the next one.
  */
  if (sms.available()) {
    Serial.println("Command received from:");
    sms.remoteNumber(senderNumber, 20);
    Serial.println(senderNumber);

    /* Print the command */
    while ((c = sms.read()) != -1) {
      Serial.print((char)c);
    }

    /* Delete the stored command */
    sms.flush();
  }
  delay(1000);
}
