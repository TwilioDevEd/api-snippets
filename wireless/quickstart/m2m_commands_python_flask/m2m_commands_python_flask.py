from flask import Flask 
from flask import request
from twilio.rest import Client
import time

app = Flask(__name__)

account = "TWILIO_SID"
token = "TWILIO_AUTH"
client = Client(account, token)

@app.route('/sms', methods=['GET', 'POST'])
def sms():
    message_sim = request.form['SimSid']
    message_command = request.form['Command']
    print(message_sim, message_command)
    time.sleep(2)
    wireless = client.wireless.commands.create(command="hello world!", sim="SIM_SID")
    return "Hello World!"

if __name__ == '__main__':
    app.run()