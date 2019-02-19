from flask import Flask 
from flask import request
from twilio.rest import Client
import time

app = Flask(__name__)

# Twilio credentials
account = "TWILIO_SID"
token = "TWILIO_AUTH"
client = Client(account, token)

# Receive a Command from a SIM via ngrok
@app.route('/sms', methods=['GET', 'POST'])
def sms():
    message_sim = request.form['SimSid']
    message_command = request.form['Command']
    print(message_sim, message_command)
    time.sleep(2)
    # This is where you could create new API requests to other Twilio services
    return "Hello World!"

# Send Command to another SIM using the Twilio API
wireless = client.wireless.commands.create(command="hello world!", sim="SIM_SID")

if __name__ == '__main__':
    app.run()
