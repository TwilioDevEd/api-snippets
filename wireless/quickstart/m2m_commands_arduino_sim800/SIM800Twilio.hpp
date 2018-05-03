#pragma once

#include <SoftwareSerial.h>
#include "Arduino.h"

#define READ_SMS_TIMEOUT    1000  // 1 Second
#define SEND_SMS_TIMEOUT    30000 // 30 Second

struct M2MCommand
{
        int16_t index;
        String date;
        String command;
};

class SIM800Twilio : public SoftwareSerial {
public:
        SIM800Twilio(
                uint8_t receive_in, 
                uint8_t transmit_in, 
                uint16_t baud_in
        ) 
                : SoftwareSerial(receive_in, transmit_in)
                , receive(receive_in)
                , transmit(transmit_in)
                , baud(baud_in)
        {}

        // Empty destructor
        ~SIM800Twilio() = default; 
    
        // Modem utilities
        void begin();
        void reset_modem();

        // Send a machine to machine command
        bool send_command(String text);
        
        // Read a command starting from an index.
        bool read_command(
                M2MCommand &m2m, 
                uint16_t index = 1, 
                bool delete_non_twilio_msgs = false
        );
        
        // Delete an individual message by index
        bool delete_SMS(uint16_t);
    
private:
        // Receive pin (software)
        uint8_t         receive;

        // Transmit pin (software)
        uint8_t         transmit;

        // Baud rate (software))
        uint16_t        baud;
        
        // Storage for when serial messages come in
        String          _storage;

        // Utility functions to send/receive SMS and to read strings from
        // Sim800 serial
        String          _read_serial(int16_t timeout = READ_SMS_TIMEOUT);
        String          _read_SMS(uint8_t index);
        bool            _send_SMS(String number, String message);
};
