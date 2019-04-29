/*
    Twilio Machine to Machine Commands Narrowband Quickstart
*/
#include <Seeed_ws2812.h>
#include <BreakoutSDK.h>

/*
  Your PSK can be found by navigating to the SIMs section of the Console,
  click on your Narrowband SIM, Click the Breakout SDK tab at the top.
  There you will see your ICCID and your PSK.
*/
static const char *device_purpose = "Dev-Kit";
static const char *psk_key = "TWILIO_PSK_KEY";

Breakout *breakout = &Breakout::getInstance();
WS2812 strip = WS2812(1, RGB_LED_PIN);

/*
  Network registration LED notification
*/
void enableLed()
{
  pinMode(RGB_LED_PWR_PIN, OUTPUT);
  digitalWrite(RGB_LED_PWR_PIN, HIGH);
  strip.begin();
  strip.brightness = 5;
}

void setup()
{
  owl_log_set_level(L_INFO);
  LOG(L_WARN, "Arduino setup() starting up\r\n");

  enableLed();
  strip.WS2812SetRGB(0, 0x20, 0x20, 0x00);
  strip.WS2812Send();

  breakout->setPurpose(device_purpose);
  breakout->setPSKKey(psk_key);

  /*
    In the non-Narrowband world, Commands are pushed to the device over SMS. Today,
    in the Narrowband world, the device must ask the server if there are any Commands
    waiting rather than the server telling the device that Commands are available.

    Instead of the server sending a Command directly to the device, the device must ask
    the server if there are any Commands available to be sent to the device. This is
    why we have polling. Polling checks the server for a new Commands at a predefined
    interval no less than 60 seconds.
  */
  breakout->setPollingInterval(10 * 60); // Optional, by default set to 10 minutes

  LOG(L_WARN, "Powering on module and registering...");
  breakout->powerModuleOn();

  const char command[] = "Hello World from BreakoutSDK test app";

  /*
     Send an text Command to Twilio using the Breakout SDK
  */
  if (breakout->sendTextCommand(command) == COMMAND_STATUS_OK)
  {
    LOG(L_INFO, "Tx-Command [%s]\r\n", command);
  }
  else
  {
    LOG(L_INFO, "Tx-Command ERROR\r\n");
  }

  strip.WS2812SetRGB(0, 0x00, 0x40, 0x00);
  strip.WS2812Send();

  LOG(L_WARN, "... done powering on and registering.\r\n");
  LOG(L_WARN, "Arduino loop() starting up\r\n");
}

/*
  Application for receiving Commands from the Breakout SDK
*/
void your_application_example()
{
  /*
    Waiting for incoming Commands
  */
  if (breakout->hasWaitingCommand())
  {
    char command[141];
    size_t commandLen = 0;
    bool isBinary = false;

    /*
      Receive Command
    */
    command_status_code_e code = breakout->receiveCommand(140, command, &commandLen, &isBinary);
    switch (code)
    {
      case COMMAND_STATUS_OK:
        LOG(L_INFO, "Rx-Command [%.*s]\r\n", commandLen, command);
        break;
      case COMMAND_STATUS_ERROR:
        LOG(L_INFO, "Rx-Command ERROR\r\n");
        break;
    }
  }
}

void loop()
{
  /*
    Add here the code for your application, but don't block
    Add in this loop calls to your own application functions.
    Don't block or sleep inside them.
  */
  your_application_example();

  /*
    The Breakout SDK checking things and doing the work
  */
  breakout->spin();

  /*
    The delay (sleep) here helps conserve power, hence it is advisable to keep it
  */
  delay(50);
}
