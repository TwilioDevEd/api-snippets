package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	connect := &twiml.VoiceConnect{}

	conversation := &twiml.VoiceConversation{}
	conversation.ServiceInstanceSid = "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	conversation.InboundAutocreation = "true"
	conversation.RoutingAssignmentTimeout = "10"

	connect.InnerElements = []twiml.Element{conversation}

	twimlResult, err := twiml.Voice([]twiml.Element{connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
