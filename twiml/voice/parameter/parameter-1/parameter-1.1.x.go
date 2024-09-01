package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	client := &twiml.VoiceClient{}

	identity := &twiml.VoiceIdentity{}
	identity.ClientIdentity = "user_jane"

	parameter1 := &twiml.VoiceParameter{}
	parameter1.Name = "FirstName"
	parameter1.Value = "Jane"

	parameter2 := &twiml.VoiceParameter{
		Name:  "LastName",
		Value: "Doe",
	}

	client.InnerElements = []twiml.Element{identity, parameter1, parameter2}

	dial.InnerElements = []twiml.Element{client}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
