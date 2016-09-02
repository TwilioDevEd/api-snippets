from flask import Flask, request
import logging

logging.basicConfig(level=logging.INFO)

app = Flask(__name__)

@app.route("/confirm", methods=['GET'])
def incoming_sms():
    unique_id = request.values.get('id', None)
    # Lookup variable `unique_id` in a database to find message_sid
    message_sid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    
    # TODO: Implement
    
    return ('Done!', 200)

if __name__ == "__main__":
    app.run(debug=True)