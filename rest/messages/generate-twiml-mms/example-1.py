from flask import Flask, request, redirect
import twilio.twiml

app = Flask(__name__)

@app.route("/sms", methods=['GET', 'POST'])
def sms_reply():
    """Respond to incoming calls with a simple text message."""

    resp = twilio.twiml.Response()
    msg = resp.message("The Robots are coming! Head for the hills!")
    msg.media("https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg")
    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)