package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	pay := &twiml.VoicePay{}
	pay.ChargeAmount = "0"
	pay.PaymentConnector = "My_Pay_Connector"
	pay.Action = "https://your-callback-function-url.com/pay"

	twimlResult, err := twiml.Voice([]twiml.Element{pay})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
