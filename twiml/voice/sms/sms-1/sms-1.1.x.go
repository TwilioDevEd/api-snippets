package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	sms := &twiml.VoiceSms{}
	sms.Message = "The king stay the king."
	sms.From = "+14105551234"
	sms.To = "+14105556789"

	twimlResult, err := twiml.Voice([]twiml.Element{sms})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
