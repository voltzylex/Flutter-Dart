const express = require("express");
require("dotenv").config(); // Load environment variables from .env file
const app = express();

console.log("Hello world");

// Use default values if environment variables are not set
const hostname = process.env.HOST || '0.0.0.0';
const port = process.env.PORT || 5000;

console.log(`Host name is ${hostname} and port name is ${port}`);

app.listen(port, hostname, (err) => {
    if (err) {
        console.error('Failed to start server:', err);
        process.exit(1); // Exit the process with a failure code
    }
    console.log(`The server is running at http://${hostname}:${port}`);
});
// get
// Create a GET endpoint
app.get('/', (req, res) => {
    // res.send('<h1>Welcome to learning node js with sushil</h1>');
    // res.send('<h2>Welcome to learning node js with sushil</h1>');
    res.send('<h3>Welcome to learning node js with sushil</h1>');

});
app.get("/video/:id", (request, response) => {
    response.json({
        VideoId: request.params.id,
        data: [
            {
                name: "sushil",
                proffesion: "flutter_developer"
            }
        ]
    })
})
// nested query params
app.get("/video/:id/:name", (request, response) => {
    response.json({
        VideoId: request.params.id,
        data: [
            {
                name: request.params.name,
                proffesion: "flutter_developer"
            }
        ]
    })
})
// C R U D

// CREATE DATA
//   app.post()
// READ THE DATA
//   app.get()
// UPDATE THE DATA
//   app.put()
// DELETE THE DATA
//   app.delete()