package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	pay := &twiml.VoicePay{}
	pay.ChargeAmount = "10.00"
	pay.PaymentConnector = "My_Generic_Pay_Connector"
	pay.Action = "https://your-callback-function-url.com/pay"

	parameter := &twiml.VoiceParameter{
		Name:  "custom_parameter_1",
		Value: "custom_value_1",
	}

	pay.InnerElements = []twiml.Element{parameter}

	twimlResult, err := twiml.Voice([]twiml.Element{pay})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
