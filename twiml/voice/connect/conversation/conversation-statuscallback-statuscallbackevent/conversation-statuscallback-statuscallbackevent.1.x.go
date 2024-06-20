package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	connect := &twiml.VoiceConnect{}

	conversation := &twiml.VoiceConversation{}
	conversation.ServiceInstanceSid = "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	conversation.StatusCallback = "https://example.com/yourStatusCallback"
	conversation.StatusCallbackEvent = "call-initiated call-ringing call-answered call-completed"

	connect.InnerElements = []twiml.Element{conversation}

	twimlResult, err := twiml.Voice([]twiml.Element{connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
