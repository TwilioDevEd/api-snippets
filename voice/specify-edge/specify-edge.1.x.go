package main

import (
	"fmt"
	"os"

	"github.com/twilio/twilio-go"
	twilioApi "github.com/twilio/twilio-go/rest/api/v2010"
	"github.com/twilio/twilio-go/twiml"
)

func main() {

	var accountSid string = os.Getenv("TWILIO_ACCOUNT_SID")
	var apiKeySid string = os.Getenv("TWILIO_API_KEY")
	var apiKeySecret string = os.Getenv("TWILIO_API_SECRET")

	var to_number = os.Getenv("TO_NUMBER")
	var from_number = os.Getenv("FROM_NUMBER")

	client := twilio.NewRestClientWithParams(twilio.ClientParams{
		Username:   apiKeySid,
		Password:   apiKeySecret,
		AccountSid: accountSid,
	})

	client.SetRegion("ie1")
	client.SetEdge("dublin")

	params := &twilioApi.CreateCallParams{}
	params.SetTo(to_number)
	params.SetFrom(from_number)

	say := &twiml.VoiceSay{
		Message: "Ahoy from Ireland",
	}

	twimlResult, twimlErr := twiml.Voice([]twiml.Element{say})
	if twimlErr != nil {
		fmt.Println(twimlErr)
	} else {
		params.SetTwiml(twimlResult)
	}

	callResp, callErr := client.Api.CreateCall(params)
	if callErr != nil {
		fmt.Println(callErr.Error())
	} else {
		fmt.Println("Call Sid: ", *callResp.Sid)
	}
}
