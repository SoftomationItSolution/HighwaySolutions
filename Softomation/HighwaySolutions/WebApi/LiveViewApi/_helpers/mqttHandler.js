const mqtt = require('mqtt');

const mqttOptions = {
    host: '127.0.0.1',
    port: 1883,
};

const mqttClient = mqtt.connect(mqttOptions);

mqttClient.on('connect', () => {
    console.log('Connected to MQTT broker');
});

// Handle MQTT client errors
mqttClient.on('error', (error) => {
    console.error('MQTT error:', error);
});
// function publishData(topic,message){
//     mqttClient.publish(topic, message, (err) => {
//         if (err) {
//             console.error('Error publishing message:', err);
//             return res.status(500).json({ error: 'Failed to publish message' });
//         }
//         res.json({ success: true, message: 'Message published successfully' });
//     });
// }

function publishData(topic, message, callback) {
    mqttClient.publish(topic, message, (err) => {
        if (err) {
            callback(err);
        } else {
            callback(null);
        }
    });
}

module.exports = {
    mqttClient,
    publishData
};
