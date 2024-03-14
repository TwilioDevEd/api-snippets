package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say := &twiml.VoiceSay{}
	say.Message = "Calling Twilio Pay"

	pay := &twiml.VoicePay{}
	pay.ChargeAmount = "20.45"
	pay.Action = "https://enter-your-callback-function-url.twil.io/pay"

	twimlResult, err := twiml.Voice([]twiml.Element{say, pay})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
