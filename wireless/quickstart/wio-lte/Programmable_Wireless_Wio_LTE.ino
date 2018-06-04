#include "ethernet.h"

Ethernet lte = Ethernet();
/* Setup variables for Twilio. The APN is fixed for Programmable Wireless. Feel free to change the URL and path. */
const char      apn[20]         = "wireless.twilio.com";
const char      URL[100]        = "s3.amazonaws.com";
char            path[100]       = \
        "GET /com.twilio.prod.twilio-docs/quest/programmable_wireless/demo/basic-demo.html HTTP/1.0\n\r\n\r";

/* No need to change HTTP port */
int port = 80;

/* 
 *  Function setup:
 *    Setup runs automatically at powerup or reset. Will attempt to connect to
 *    Programmable Wireless and retreive the web poage listed.
 *   
 *    Inputs: None
 *
 *    Outputs: None
 */
void setup() 
{
        /* Start Serial Output and GPRS */
        SerialUSB.begin(115200);
        lte.Power_On();
        SerialUSB.println("\n\rSerial working.");


        while(!lte.Check_If_Power_On()) {
                SerialUSB.println("Waiting for module power up.");
                delay(1000);
        }
        while(!(lte.init())) {
                SerialUSB.print("Initializing LTE...");
                delay(1000);
        }
        lte.join(apn);

        /* Print out IP data if successful */
        SerialUSB.print("\n\rIP Address: ");
        SerialUSB.print(lte.ip_string);

        /* Connect to host and path */
        if(lte.connect(URL, port, TCP)) {
                lte.write(path);
                while(MODULE_PORT.available()) {
                        serialDebug.write(MODULE_PORT.read());
                }    
                lte.close(1);
        } else {
                SerialUSB.println("Connection Error!");
        }
}

/* 
 *  Function loop:
 *    After setup() runs, this will loop continuously until the board is reset
 *    or loses power.
 *   
 *    Inputs: None
 *
 *    Outputs: None
 */
void loop() 
{
        /* Write data out to the Serial port, if available. */
        AT_bypass();
        
        /* Put your code here after commenting out the above. */
}