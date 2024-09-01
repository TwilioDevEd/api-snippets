package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.CallerId = "+1888XXXXXXX"

	number := &twiml.VoiceNumber{
		PhoneNumber: "858-987-6543",
	}

	client1 := &twiml.VoiceClient{}
	client1.Identity = "joey"

	client2 := &twiml.VoiceClient{}
	client2.Identity = "charlie"

	dial.InnerElements = []twiml.Element{number, client1, client2}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
