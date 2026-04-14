const express = require('express');
const app = express();

app.get('/api', (req, res) => {
    res.send("MERN Backend Running");
});

app.listen(5000, () => console.log("Server running"));
