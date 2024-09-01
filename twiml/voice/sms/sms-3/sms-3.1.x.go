package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say := &twiml.VoiceSay{}
	say.Message = "Our store is located at 123 Easy St."

	sms := &twiml.VoiceSms{}
	sms.Message = "Store Location: 123 Easy St."
	sms.Action = "/smsHandler.php"
	sms.Method = "POST"

	twimlResult, err := twiml.Voice([]twiml.Element{say, sms})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
