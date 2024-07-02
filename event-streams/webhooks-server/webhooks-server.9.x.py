import os
from typing import Annotated
import json

from fastapi import FastAPI, Request, Header
from twilio.request_validator import RequestValidator


TWILIO_AUTH_TOKEN = os.getenv("TWILIO_AUTH_TOKEN")

app = FastAPI()
validator = RequestValidator(TWILIO_AUTH_TOKEN)

@app.post("/my-webhook-url")
async def webhooks_endpoint(
        request: Request,
        x_twilio_signature: Annotated[str, Header()]
    ):
    print()
    print("------------------------------------------------")

    raw_body: str = (await request.body()).decode("utf-8")

    # validate the signature
    if not validator.validate(str(request.url), raw_body, x_twilio_signature):
        print("Invalid signature. Discarded event.")
        return "Invalid signature"
    
    print("Valid signature. Processing event.")

    # parse the body
    body: list = json.loads(raw_body)
    for event in body:
        print("Received event")
        print("\tType: " + event["type"])
        print("\tTimestamp: " + event["time"])
        print("\tRaw event: " + str(event))
    
    print("------------------------------------------------")
    print()
    return "Ok"
