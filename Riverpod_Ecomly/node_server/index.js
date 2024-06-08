const express = require("express");
const app = express();
console.log("Hello world");
// node mon -- node monitor

// start the server >> 192.168.0.0
const hostname = "0.0.0.0";
const port = 5000;
app.listen(port, hostname, () => {
    console.log(`The server is running at http://${hostname}:${port}`);
})
// http//0.0.0.0:5000