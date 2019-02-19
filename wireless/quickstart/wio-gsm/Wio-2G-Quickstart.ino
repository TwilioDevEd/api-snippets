#include "MC20_Common.h"
#include "MC20_Arduino_Interface.h"
#include "MC20_GPRS.h"
GPRS gprs = GPRS();

/* 
 * Setup variables for Twilio. 
 *
 * The APN is fixed for Programmable Wireless. 
 * Feel free to change the URL and path. 
 */
const char      APN[20]         = "wireless.twilio.com";
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
        int ret = 0;

        /* Start Serial Output and GPRS */
        SerialUSB.begin(115200);
        gprs.Power_On();
        SerialUSB.println("\n\rSerial working.");
        
        if(!(ret = gprs.init(APN))) {
                SerialUSB.print("Problem with GPRS init: ");
                SerialUSB.println(ret);
        }
        gprs.join();

        /* Print out IP data if successful */
        SerialUSB.print("\n\rIP Address: ");
        SerialUSB.print(gprs.ip_string);

        /* Connect to host and path */
        if(gprs.connectTCP(URL, port)) {
                gprs.sendTCPData(path);  
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
        if(SerialUSB.available()){
                serialMC20.write(SerialUSB.read());
        }
        
        if(serialMC20.available()){     
                SerialUSB.write(serialMC20.read()); 
        }
        
        /* Put your code here */
}