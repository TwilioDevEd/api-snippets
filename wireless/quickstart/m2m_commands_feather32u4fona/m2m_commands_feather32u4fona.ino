/*
    Twilio Machine to Machine Commands Quickstart on Adafruit Feather 32u4 FONA
*/

#include "Adafruit_FONA.h"
#include <SoftwareSerial.h>

#define FONA_RX  9
#define FONA_TX  8
#define FONA_RST 4
#define FONA_RI  7

/*
    Software Serial definitions:
    https://www.arduino.cc/en/Reference/SoftwareSerial

    If you get errors, lower the modem baud rate.
*/
SoftwareSerial fonaSS = SoftwareSerial(FONA_TX, FONA_RX);
SoftwareSerial *fonaSerial = &fonaSS;

Adafruit_FONA fona = Adafruit_FONA(FONA_RST);

char replybuffer[255];

void setup() {
  while (!Serial);
  Serial.begin(115200);
  Serial.println(F("FONA SMS caller ID test"));
  Serial.println(F("Initializing....(May take 3 seconds)"));

  /*
     Adafruit Feather 32u4 FONA setup
  */
  fonaSerial->begin(4800);
  if (! fona.begin(*fonaSerial)) {
    Serial.println(F("Couldn't find FONA"));
    while (1);
  }
  Serial.println(F("FONA is OK"));
  fonaSerial->print("AT+CNMI=2,1\r\n");

  Serial.println("Sending Command!");
 
  /*
     Send an SMS to short code 2936, which is a Twilio
     Machine to machine command.
  */
  char sendto[21] = "2936";

  /*
      Keep `command` under 160 ASCII characters, or 67 UCS-2 characters.
      https://www.twilio.com/docs/glossary/what-sms-character-limit
  */
  char command[141] = "hello from feather32u4";

  /*
      Write a Twilio M2M command.
  */
  if (!fona.sendSMS(sendto, command)) {
    Serial.println(F("Failed"));
  } else {
    Serial.println(F("Sent!"));
  }
}

void loop() {
  uint16_t smslen;
  int index = 1;
  /*
      Read a Twilio M2M command. Note that it will find the lowest
      indexed one with the code as is; in your code. if you cache the
      index you can start the next read_command to move to the next one.
  */

  if (!fona.readSMS(index, replybuffer, 250, &smslen)) {
    Serial.println(F("Failed!"));
  } else {

    /* Print the command */
    Serial.println(replybuffer);
    delay(2000);

    /* Delete the stored command */
    fona.deleteSMS(1);

    /* That's all, folks! */
    Serial.println("Finished.");
    while (1) {
      delay(5000);
    }
  }
  /* Poll for a stored command every 5 seconds */
  delay(5000);
}
