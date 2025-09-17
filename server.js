const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', function connection(ws) {
    console.log("a new client has connected");

    ws.on('message', function message(data) {
        console.log(data.toString());

        if (data.toString() === "!test") {
            ws.send("received command from roblox");
            console.log("wow!"); // u can use ts to make the server do smth instead of printing a message
        }
        else {
            ws.send(data.toString()); // we dont want the commands to log, do we?
        }
    });

    ws.send("connection established.");
});
