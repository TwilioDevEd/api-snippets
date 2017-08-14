import paho.mqtt.client as mqtt

#
# Use the actual location of your downloaded certificate and key.
#
pem_location = '/…/CY499a5cbd774f4970a9ab51e2e8c4fb57.pem'
key_location = '/…/CY499a5cbd774f4970a9ab51e2e8c4fb57.key.decrypted'

client = mqtt.Client(client_id="bob", clean_session=False)
client.set_tls(None, pem_location, key_location)

#
# Print out any updates.
#
def print_message(client, userdata, msg):
    print(msg.topic + ' ' + str(msg.payload))

client.on_message = print_message

#
# Use qos=1 to get your device caught up right away.
#
client.connect('mqtt-sync.us1.twilio.com', 8883, 60)
client.subscribe('sync/docs/MyDoc', qos=1)
client.loop_forever()
