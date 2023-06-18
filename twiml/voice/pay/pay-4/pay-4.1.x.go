package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	pay := &twiml.VoicePay{}
	pay.PaymentConnector = "Stripe_Connector_1"

	twimlResult, err := twiml.Voice([]twiml.Element{pay})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
