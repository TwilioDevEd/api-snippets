/*
    Twilio Machine to Machine Commands Quickstart on Adafruit 3G Fona

    ~ WIRING ~

    3G FONA ----- Arduino UNO
    5V ---------- 5v
    GND --------- GND
    KEY --------- GND
    RST --------- 4
    TX ---------- 3
    RX ---------- 2
*/

#include "Adafruit_FONA.h"
#include <SoftwareSerial.h>


/* Specific to the FONA 3G. */
#define FONA_RX 2
#define FONA_TX 3
#define FONA_RST 4

/*
    Software Serial definitions:
    https://www.arduino.cc/en/Reference/SoftwareSerial

    If you get errors, lower the modem baud rate.
*/
SoftwareSerial fonaSS = SoftwareSerial(FONA_TX, FONA_RX);
SoftwareSerial *fonaSerial = &fonaSS;

Adafruit_FONA_3G fona = Adafruit_FONA_3G(FONA_RST);

char replybuffer[255];

void setup() {
  while (!Serial);
  Serial.begin(115200);
  Serial.println(F("FONA SMS caller ID test"));
  Serial.println(F("Initializing....(May take 3 seconds)"));

  /*
     Adafruit Feather FONA 3G setup.
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
  char command[141] = "hello from the FONA 3G";

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

    /* Print the command. */
    SerialUSB.println(replybuffer);
    delay(2000);

    /* Delete the stored command. */
    fona.deleteSMS(1);

    /* That's all, folks! */
    Serial.println("Finished.");

    /* Send a final sign-off command. */
    if (!fona.sendSMS("2936", "signing off")) {
      Serial.println(F("Failed"));
    } else {
      Serial.println(F("Sent!"));
    }
    while (1) {
      delay(5000);
    }
  }
  /* Poll for a stored command every 5 seconds */
  delay(5000);
}
