package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	start := &twiml.VoiceStart{}

	stream := &twiml.VoiceStream{}
	stream.Url = "wss://mystream.ngrok.io/example"

	param1 := &twiml.VoiceParameter{}
	param1.Name = "FirstName"
	param1.Value = "Jane"

	param2 := &twiml.VoiceParameter{}
	param2.Name = "LastName"
	param2.Value = "Doe"

	stream.InnerElements = []twiml.Element{param1, param2}

	start.InnerElements = []twiml.Element{stream}

	twimlResult, err := twiml.Voice([]twiml.Element{start})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
