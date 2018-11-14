#include "SIM800Twilio.hpp"

/*
 * Reserve storage space, begin Software Serial and reset the modem
 */
void SIM800Twilio::begin()
{
        _storage.reserve(512);
        this->SoftwareSerial::begin(baud);
        this->reset_modem();
}

/*
 * Send 'AT' to the modem
 */
void SIM800Twilio::reset_modem()
{
        this->print("AT\r\n");
        while (_read_serial().indexOf("OK") == -1) {
                this->print("AT\r\n");
        }
        
        delay(1000);

        /* 
         * Clear out any extra messages - depending on state,
         * the module may send out Voice Ready/SMS Ready messages.
         */

        _read_serial();
        _read_serial();
}

/*
 * Find the next indexed message from short code 2936, which is a Twilio
 * Machine to machine command.
 * Inputs:
 *  - m2m : Machine to machine command struct
 *  - index : SMS index to start the search
 *  - delete_non_twilio_msgs : To delete messages not from 2936
 *
 * Outputs:
 *  - m2m : Populated command (if success)
 *  - bool (method) : Whether a command was found
 */
bool SIM800Twilio::read_command(
        M2MCommand &m2m, 
        uint16_t index, 
        bool delete_non_twilio_msgs)
{
        bool foundCommand = false;

        while (1) {
                String text = _read_SMS(index);
                if (( text.indexOf("ERROR")) != -1 && text.length() < 20) {
                        return false;
                }

                if (text.indexOf("OK") != -1 && text.length() < 20) {
                        ++index;
                        continue;
                }
        
                /* Extract the number */         
                int16_t p1 = text.indexOf(","); 
                int16_t p2 = text.indexOf(",", p1+1);
                
                if (p1 == -1 || p2 == -1 || p1 == p2) {
                        ++index;
                        continue;
                }

                /* Check it is a Twilio Command from shortcode 2936*/
                if (text.substring(p1+2, p2-1).indexOf("2936") == -1) {
                        if (delete_non_twilio_msgs) {
                                // Remove the message
                                delete_SMS(index);
                        }
                        ++index;
                        continue;
                }

                m2m.index = index;
                
                /* Extract the date */
                p1 = text.indexOf(",", p2+1);
        
                if (p1 == -1 || p2 == -1 || p1 == p2) {
                        ++index;
                        continue;
                }
        
                p1 = text.indexOf("\"", p1+1);
                p2 = text.indexOf("\"", p1+1);
        
                m2m.date = text.substring(p1+1, p2-1);
        
                /* Extract the message */
        
                p1 = text.lastIndexOf("OK");
                m2m.command = text.substring(p2+3, p1-4);
                
                return true;
        }
        
        return false;
}

/*
 * Send an SMS to short code 2936, which is a Twilio
 * Machine to machine command.
 * Inputs:
 *  - command : String holding a command (keep it under 160 ASCII/67 UCS-2)
 *
 * Outputs:
 *  - bool (method) : Whether a command was sent successfully
 */
bool SIM800Twilio::send_command(String command)
{
        return _send_SMS("2936", command);
}

/*
 * Delete an SMS by index
 * Inputs:
 *  - index : The index of the SMS on the SIM800
 *
 * Outputs:
 *  - bool (method) : Whether the SMS was deleted successfully
 */
bool SIM800Twilio::delete_SMS(uint16_t index)
{
        this->print("AT+CMGD=");
        this->print(index);
        this->print(",0\n\r");
    
        _storage=_read_serial();
        if ( (_storage.indexOf("ERROR")) == -1) {
                return false;
        }
    
        return true;
}

bool SIM800Twilio::_send_SMS(String number, String message)
{
        this->print("AT+CMGF=1\r\n");
        _storage=_read_serial();
    
        this->print("AT+CMGS=\"");
        this->print(number);
        this->print("\"\r\n");
        _storage = _read_serial();
    
        this->print (message);
        this->print ("\r\n");
        _storage = _read_serial();

        /* EOM character ^Z */
        this->write(0x1A);
        _storage=_read_serial(SEND_SMS_TIMEOUT);

    
        if (_storage.indexOf("ERROR") == -1) {
                return false;
        }
    
        return true;
}

String SIM800Twilio::_read_SMS(uint8_t index)
{

        this->print ("AT+CMGF=1\r");

        if (( _read_serial().indexOf("ERROR")) == -1) {
                this->print ("AT+CMGR=");
                this->print (index);
                this->print ("\r");
                _storage = _read_serial();
                
                if (_storage.indexOf("+CMGR")!=-1) {
                        return _storage;
                } else {
                        return "";
                }

                return "";
        }
}

String SIM800Twilio::_read_serial(int16_t timeout)
{
        for (int i = 0; i < 100; ++i ) {
                if (this->available()) break;
                delay(50);
        }
    
        String temp;

        uint64_t last_char = millis();
        while (millis() < last_char + timeout) {
                if (this->available()) {
                        temp += (char) this->read();
                        last_char = millis();
                }
        }
    
        return temp;
}
