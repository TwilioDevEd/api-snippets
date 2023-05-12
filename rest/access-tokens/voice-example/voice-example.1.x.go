package main

import (
	"fmt"
	"os"

	"github.com/twilio/twilio-go/client/jwt"
)

func main() {
	// Get your Account SID from https://twilio.com/console
	// To set up environment variables, see http://twil.io/secure
	// Required for all types of tokens
	var twilioAccountSid string = os.Getenv("TWILIO_ACCOUNT_SID")
	var twilioApiKey string = os.Getenv("TWILIO_API_KEY")
	var twilioApiSecret string = os.Getenv("TWILIO_API_SECRET")

	var outgoing_application_sid string = os.Getenv("APxxxxxxxxxxxxx")

	params := jwt.AccessTokenParams{
		AccountSid:    twilioAccountSid,
		SigningKeySid: twilioApiKey,
		Secret:        twilioApiSecret,
		Identity:      "user",
	}

	jwtToken := jwt.CreateAccessToken(params)
	voiceGrant := &jwt.VoiceGrant{
		Outgoing: jwt.Outgoing{
			ApplicationSid: outgoing_application_sid,
		},
		Incoming: jwt.Incoming{
			Allow: true,
		},
	}

	jwtToken.AddGrant(voiceGrant)
	token, err := jwtToken.ToJwt()

	if err != nil {
		error := fmt.Errorf("error: %q", err)
		fmt.Println(error.Error())
	}

	fmt.Println(token)
}
