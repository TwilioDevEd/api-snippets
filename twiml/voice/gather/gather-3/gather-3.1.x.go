package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	gather := &twiml.VoiceGather{}
	gather.Action = "/process_gather.php"
	gather.Method = "GET"

	nestedSay := &twiml.VoiceSay{}
	nestedSay.Message = "Please enter your account number,\nfollowed by the pound sign"

	gather.InnerElements = []twiml.Element{nestedSay}

	failoverSay := &twiml.VoiceSay{}
	failoverSay.Message = "We didn't receive any input. Goodbye!"

	twimlResult, err := twiml.Voice([]twiml.Element{gather, failoverSay})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
